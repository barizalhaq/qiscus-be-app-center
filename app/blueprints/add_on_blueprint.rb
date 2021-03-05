class AddOnBlueprint < Blueprinter::Base
    identifier :id
    fields :contact_email, :author, :caption, :name, :icon_url
    
    view :detail do
        fields :description, :how_to_install, :images
    end

end
