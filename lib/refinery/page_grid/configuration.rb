module Refinery
  module PageGrid
    include ActiveSupport::Configurable

    config_accessor :margin_options, :width_options, :margin_class, :width_class

    self.margin_options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    self.width_options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    self.margin_class = "prefix_#"
    self.width_class = "grid_#"
  
  end
end