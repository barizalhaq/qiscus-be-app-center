ActiveAdmin.register AddOn do
  menu label: "Add On", priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :author, :contact_email, :how_to_install
  
  # index do
  #   name :name
  # end

  form do |f|
    f.inputs 'Add On' do
      f.input :name
      f.input :description, as: :froala_editor
      f.input :how_to_install, as: :froala_editor
    end
    f.actions
  end
end
