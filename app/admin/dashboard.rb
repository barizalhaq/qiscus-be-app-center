ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Top AddOn" do
          table_for AddOn.limit(10) do
            column("id") { |order| order.id }
            column("Name") { |order| order.name }
            # column("Total")   { |order| number_to_currency order.total_price }
          end
        end
      end

      column do
        panel "Last Subscribe" do
          table_for Subscription.limit(10) do
            column("id") { |subscribe| subscribe.id }
            column("Name") { |subscribe| subscribe.app.name }
            # column("Total")   { |order| number_to_currency order.total_price }
          end
        end
      end
    end # columns
  end # content
end
