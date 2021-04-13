ActiveAdmin.register AddOn do
  menu label: "Add On", priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, 
  :description, :author, :contact_email, :how_to_install, :caption, :icon, 
  :icon_url, :webhook_url, :identifier, :setting_url, :published, images: []
  
  index do
    column :name
    column :author
    column :caption
    column :published
    actions
  end

  show do
    attributes_table do
      row :name
      row :author
      row :contact_email
      row :caption
      row :description
      row :how_to_install
      row :icon_url
      row :webhook_url
      row :setting_url
      row :identifier
      row :published
      row "IMAGES" do |add_on|
        ul do
          add_on.images.each do |img|
            li do
                img src: img.service_url, style: "max-height: 500px; max-width: 500px;", alt: img.blob.filename
                figcaption img.blob.filename
            end
          end
        end
      end
    end
    active_admin_comments
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Add On' do
      f.input :name
      f.input :author
      f.input :contact_email
      f.input :caption
      f.input :description, as: :quill_editor
      f.input :how_to_install, as: :quill_editor
      f.input :icon_url
      f.input :webhook_url
      f.input :setting_url
      f.input :identifier
      f.input :images, as: :file, input_html: { multiple: true }
      if f.add_on.images.attached?
        ul do
          f.add_on.images.each do |img|
            li do
              figure do
                img src: img.service_url, style: "max-height: 500px; max-width: 500px;", alt: img.blob.filename
                figcaption img.blob.filename
                a "Delete", href: delete_add_on_image_admin_add_on_path(img.id), "data-method": :delete, "data-confirm": "Are you sure want to delete this image?"
              end
            end
          end
        end
      end
      f.input :published
    end
    f.actions
  end

  member_action :delete_add_on_image, method: :delete do
    @img = ActiveStorage::Attachment.find(params[:id])
    @img.purge
    redirect_back(fallback_location: admin_add_ons_path)
  end
end