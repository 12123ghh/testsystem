class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name

      t.timestamps
    end

    remove_column :papers, :subject, :text
    add_reference :papers, :subject, foreign_key: true
    add_reference :questions, :subject, foreign_key: true
  end
end
