class AddIsRightAnswerToOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :options, :is_right_answer, :boolean, default: false
  end
end
