ActiveAdmin.register AddOn do
  menu label: "Add On", priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :category_id,
  :description, :author, :contact_email, :how_to_install, :caption, :icon, 
  :webhook_url, :identifier, :setting_url, :published, :description_video_url, :how_to_install_video_url, images: []
  
  index do
    column :name
    column :category
    column :author
    column :caption
    column :published
    actions
  end

  show do
    attributes_table do
      row :name
      row "Category" do |add_on|
        add_on.category.title unless !add_on.category.present?
      end
      row :author
      row :contact_email
      row :caption
      row :description
      row :description_video_url
      row :how_to_install
      row :how_to_install_video_url
      row "ICON" do |add_on|
        if add_on.icon.attached?
          img src: add_on.icon.url, style: "max-height: 500px; max-width: 500px;", alt: add_on.icon.blob.filename
          figcaption add_on.icon.blob.filename
        end
      end
      row :webhook_url
      row :setting_url
      row :identifier
      row :published
      row "IMAGES" do |add_on|
        if add_on.images.attached?
          ul do
            add_on.images.each do |img|
              li do
                  img src: img.url, style: "max-height: 500px; max-width: 500px;", alt: img.blob.filename
                  figcaption img.blob.filename
              end
            end
          end
        end
      end
    end
    active_admin_comments
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Add On' do
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :category_id, :as => :select, :collection => Category.all.collect { |category| [category.title, category.id] }
      f.input :author
      f.input :contact_email
      f.input :caption
      f.input :description, as: :quill_editor
      f.input :description_video_url
      f.input :how_to_install, as: :quill_editor
      f.input :how_to_install_video_url
      if f.add_on.icon.attached? && f.add_on.icon.persisted?
        figure do
          img src: f.add_on.icon.url, style: "max-height: 500px; max-width: 500px;", alt: f.add_on.icon.blob.filename
          figcaption f.add_on.icon.blob.filename
          a "Delete", href: delete_add_on_icon_admin_add_on_path(f.add_on.icon.id), "data-method": :delete, "data-confirm": "Are you sure want to delete this icon?"
        end
      else
        f.input :icon, as: :file
      end
      f.input :webhook_url
      f.input :setting_url
      f.input :identifier
      f.input :images, as: :file, input_html: { multiple: true }
      if f.add_on.images.attached?
        ul do
          f.add_on.images.each do |img|
            li do
              figure do
                img src: img.url, style: "max-height: 500px; max-width: 500px;", alt: img.blob.filename
                figcaption img.blob.filename
                a "Delete", href: delete_add_on_image_admin_add_on_path(img.id), "data-method": :delete, "data-confirm": "Are you sure want to delete this image?"
              end
            end unless !img.persisted?
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

  member_action :delete_add_on_icon, method: :delete do
    @icon = ActiveStorage::Attachment.find(params[:id])
    @icon.purge
    redirect_back(fallback_location: admin_add_ons_path)
  end
end