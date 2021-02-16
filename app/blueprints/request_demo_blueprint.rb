class RequestDemoBlueprint < Blueprinter::Base
    identifier :id
    fields :name, :contact_phone, :contact_email, :reason
end
