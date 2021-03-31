ActiveAdmin.register AddOn do
  menu label: "Add On", priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, 
  :description, :author, :contact_email, :how_to_install, :caption, :icon, 
  :icon_url, :webhook_url, :identifier, :setting_url, :published
  
  index do
    column :name
    column :author
    column :caption
    column :published
    # column :icon
    # default_actions
    actions
  end

  form do |f|
    f.inputs 'Add On' do
      f.input :name
      f.input :author
      f.input :contact_email
      f.input :caption
      f.input :description, as: :quill_editor
      f.input :how_to_install, as: :quill_editor
      # f.input :icon, as: :file
      f.input :icon_url
      f.input :webhook_url
      f.input :setting_url
      f.input :identifier
      # f.input :images
      f.input :published
    end
    f.actions
  end
end