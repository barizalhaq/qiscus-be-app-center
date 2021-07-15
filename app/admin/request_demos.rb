ActiveAdmin.register RequestDemo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :app_id, :add_on_id, :contact_email, :contact_phone, :status, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:app_id, :add_on_id, :contact_email, :contact_phone]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  actions :all, except: [:new]
  
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

  end
  
end
