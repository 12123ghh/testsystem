class AddLevelToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :level, :integer, default: 0
  end
end
