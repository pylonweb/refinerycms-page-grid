require 'refinerycms-core'

module Refinery
  autoload :PageGridGenerator, 'generators/refinery/page_grid/page_grid_generator'

  module PageGrid
    require 'refinery/page_grid/engine'
    require 'refinery/page_grid/configuration'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
