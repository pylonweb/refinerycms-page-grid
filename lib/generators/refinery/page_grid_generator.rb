module Refinery
  class PageGridGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_page_grid:install:migrations")
    end

  end
end
