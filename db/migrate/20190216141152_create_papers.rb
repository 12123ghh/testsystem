class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.text :subject
      t.integer :question_number
      t.integer :total_points
      t.integer :teacher_id

      t.timestamps
    end
  end
end
