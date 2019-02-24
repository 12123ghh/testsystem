class AddIndexToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_table :questions do |t|
      t.belongs_to :paper ,index: true
    end
  end
end
