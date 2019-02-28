class AddOptionIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :content, :text
    remove_column :answers, :accuracy, :float

    add_reference :answers, :option, foreign_key: true, index: true
  end
end
