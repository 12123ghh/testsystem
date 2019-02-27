class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :user, index: true
      t.references :paper, index: true
      t.datetime :finished_at, comment: "考试完成时间"
      t.integer :state, default: 1

      t.timestamps
    end
  end
end
