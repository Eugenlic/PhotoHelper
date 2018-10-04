ActiveAdmin.register Order do
  permit_params :status, :price, :image
  actions :all, except: :edit
  index do
    column :user
    column :description
    column :image do |order|
      image_tag(order.image_url(:thumb))
    end
    column :status
    column :price
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :description
      row :image do
        link_to image_tag(order.image_url(:thumb)), order.image_url(:large)
      end
      row :status
      row :price
    end
    active_admin_comments
  end

  action_item :to_value, only: :show do
    link_to t('.to_value'), to_value_admin_order_path if order.considered?
  end

  action_item :attach_photo, only: :show do
    link_to t('.attach_photo'), attach_photo_admin_order_path if order.in_work?
  end

  member_action :to_value, title: I18n.t('active_admin.to_value') do
    @order = Order.find(params[:id])
    render :assessments
  end

  member_action :attach_photo, title: I18n.t('active_admin.attach_photo') do
    @order = Order.find(params[:id])
    render :attach_photo
  end

  controller do
    def update
      resource.valuated! if resource.considered?
      resource.ready! if resource.in_work?
      super
    end
  end
end
