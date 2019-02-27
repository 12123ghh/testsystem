class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :exam, index: true
      t.references :question, index: true
      t.text :content
      t.float :accuracy, default: 0, comment: "正确率，0-100%"

      t.timestamps
    end
  end
end
