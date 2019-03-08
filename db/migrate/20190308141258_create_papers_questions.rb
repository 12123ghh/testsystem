class CreatePapersQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :papers_questions do |t|
      t.references :paper
      t.references :question
    end

    remove_column :questions, :paper_id, :integer
  end
end
