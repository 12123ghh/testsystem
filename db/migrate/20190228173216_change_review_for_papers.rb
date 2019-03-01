class ChangeReviewForPapers < ActiveRecord::Migration[5.2]
  def change
  	change_column :papers,:review,:integer, default: "check"
  end
end
  