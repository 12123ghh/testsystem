class AddQuestionTypeToQuestions < ActiveRecord::Migration[5.2]
  def change
  	add_column :questions, :question_type, :integer, default: 0
  	add_column :questions, :standard_answer, :text
  	add_column :questions, :true_answer, :boolean
  end
end
