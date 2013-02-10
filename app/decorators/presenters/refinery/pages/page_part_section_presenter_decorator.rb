# Open the Refinery::PagePart model for manipulation

Refinery::Pages::PagePartSectionPresenter.class_eval do

  def initialize(page_part)
    super()
    self.fallback_html = page_part.body.html_safe if page_part.body
    self.id = convert_title_to_id(page_part.title) if page_part.title
    self.html_class << Refinery::PageGrid.margin_class.gsub('#', page_part.margin.to_s) if page_part.margin
    self.html_class << Refinery::PageGrid.width_class.gsub('#', page_part.width.to_s) if page_part.width
  end

  def html_class
    @html_class ||= []
  end
  
private

  def wrap_content_in_tag(content)
    content_tag(:section, content_tag(:div, content, :class => 'inner'), :id => id, :class => html_class.join(' '))
  end

end
