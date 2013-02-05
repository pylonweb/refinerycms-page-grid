# Open the Refinery::PagePart model for manipulation
Refinery::Page.class_eval do
  attr_accessible :margin, :width
end