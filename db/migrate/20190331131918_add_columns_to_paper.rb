class AddColumnsToPaper < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :multiple_choice_count, :integer, default: 0
    add_column :papers, :sentence_completion_count, :integer, default: 0
    add_column :papers, :true_or_flase_question_count, :integer, default: 0
    add_column :papers, :short_answer_question_count, :integer, default: 0
  end
end
