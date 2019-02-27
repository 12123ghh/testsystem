class AddReviewToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :review, :char
  end
end
