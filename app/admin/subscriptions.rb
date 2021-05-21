ActiveAdmin.register Subscription do
  menu priority: 4
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :app_id, :add_on_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:app_id, :add_on_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  sidebar "Subscription" do
    render('/admin/sidebar_links', :model => 'subscriptions')
  end

  # index do
  #   column :name
  #   column :author
  #   column :caption
  #   # column :icon
  #   # default_actions
  #   actions
  # end

end
