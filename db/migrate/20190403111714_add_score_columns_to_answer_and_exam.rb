class AddScoreColumnsToAnswerAndExam < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :score, :integer, default: 0
    add_column :answers, :total_score, :integer, default: 0
  end
end
