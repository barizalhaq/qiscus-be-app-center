ActiveAdmin.register RequestDemo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :app_id, :add_on_id, :contact_email, :contact_phone, :status, :name, :reason
  #
  # or
  #
  # permit_params do
  #   permitted = [:app_id, :add_on_id, :contact_email, :contact_phone]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  actions :all, except: [:new]

  form do |f|
    f.inputs do
      f.input :app_id, :as => :select, :collection => App.all.collect { |app| [app.name, app.id] }, :input_html => { :disabled => true }
      f.input :add_on_id, :as => :select, :collection => AddOn.all.collect { |addon| [addon.name, addon.id] }, :input_html => { :disabled => true }
      f.input :contact_email, :input_html => { :disabled => true }
      f.input :contact_phone, :input_html => { :disabled => true }
      f.input :reason, :input_html => { :disabled => true }
      f.input :status
      f.input :name, :input_html => { :disabled => true }
    end
    f.actions
  end
  
  controller do

    def show
      begin
        @request_demo = RequestDemo.find(params[:id])

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

    def update
      request_demo = RequestDemo.find(params[:id])
      request_demo.update(status: params.require(:request_demo)[:status])

      redirect_to admin_request_demo_path
      return
    end

  end
  
end
