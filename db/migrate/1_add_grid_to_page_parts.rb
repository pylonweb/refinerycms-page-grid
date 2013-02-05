class AddGridToPageParts < ActiveRecord::Migration

  def change
    add_column :refinery_page_parts, :margin, :integer
    add_column :refinery_page_parts, :width, :integer
  end

end
