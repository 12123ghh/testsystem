class AddContentToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :content, :text
    add_column :answers, :true_answer, :boolean
  end
end
