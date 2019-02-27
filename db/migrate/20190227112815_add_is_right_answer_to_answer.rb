class AddIsRightAnswerToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :is_right_answer, :boolean, default: false
  end
end
