class AddOnBlueprint < Blueprinter::Base
    identifier :id
    fields :contact_email, :author, :caption, :name
    field :status do |add_on, options|
        installed = options[:current_app].subscriptions.find { |subscription| subscription.add_on_id == add_on.id }
        if installed
            :approved
        else
            demo = add_on.request_demos.find { |demo| demo.app_id == options[:current_app].id }
            demo.status unless demo == nil
        end
    end
    field :icon_url do |add_on, options|
        add_on.icon.url unless !add_on.icon.attached? && !add_on.icon.persisted?
    end
    association :category, blueprint: CategoryBlueprint

    view :detail do
        fields :description, :how_to_install
        field :setting_url do |add_on, options|
            add_on.setting_url unless !add_on.setting_url.to_s.strip.empty?
        end
        field :installed do |add_on, options|
            options[:current_app].subscriptions.any? { |item| item[:add_on_id] == add_on.id }
        end
        field :images do |add_on|
            add_on.getImages
        end
    end

    view :my_add_on do
        fields :setting_url
    end

end
