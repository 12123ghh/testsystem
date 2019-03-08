class AddLevelToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :level, :integer, default: 0
  end
end
