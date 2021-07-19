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

  actions :all, except: [:new, :edit, :update]
  
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

  controller do
    def show
      begin
        @subscription = Subscription.find(params[:id])
        respond_to do |format|
          format.html { render :show }
        end
      rescue ActiveRecord::RecordNotFound
        respond_to do |format|
          format.html { render :file => "#{Rails.root}/public/404.html", :layout => false, :status => :not_found }
          format.xml  { head :not_found }
          format.any  { head :not_found }
        end
      end
    end
  end

end
