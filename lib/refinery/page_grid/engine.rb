module Refinery
  module PageGrid
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::PageGrid

      engine_name :refinery_page_grid

      initializer "register refinerycms_page_grid plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "page-grid"
          plugin.hide_from_menu = true
          
        end
      end

      config.after_initialize do

        Refinery.register_extension(Refinery::PageGrid)
        Refinery::Core.config.register_javascript 'page-grid'
        Refinery::Core.config.register_stylesheet 'page-grid'

        Refinery::PagePart.send :attr_accessible, :margin, :width
      end
    end
  end
end
