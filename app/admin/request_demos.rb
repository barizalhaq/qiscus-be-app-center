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
  
  controller do
    # This code is evaluated within the controller class

    def define_a_method
      # Instance method
    end
  end
  
end
