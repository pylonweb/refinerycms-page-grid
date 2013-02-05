module Refinery
  class PageGridGenerator < Rails::Generators::Base

  	source_root File.expand_path("../templates", __FILE__)

    def generate_page_grid_initializer
      template "config/initializers/refinery/page_grid.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "page_grid.rb")
    end

    def rake_db
      rake("refinery_page_grid:install:migrations")
    end

  end
end
