class ChangeViewForPapers < ActiveRecord::Migration[5.2]
  def change
	change_column :papers,:review,:integer
  end
end
