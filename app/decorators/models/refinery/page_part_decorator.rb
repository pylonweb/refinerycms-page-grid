# Open the Refinery::PagePart model for manipulation
Refinery::PagePart.class_eval do
  attr_accessible :margin, :width
end