module Refinery
  module PageGrid
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::PageGrid

      engine_name :refinery_page_grids

      initializer "register refinerycms_page_grid plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "page-grid"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.page_grids_admin_page_grids_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/page_grids/page_grid'
          }
          plugin.in_menu = false
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PageGrid)
      end
    end
  end
end
