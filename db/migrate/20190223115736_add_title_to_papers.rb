class AddTitleToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :title, :text
  end
end
