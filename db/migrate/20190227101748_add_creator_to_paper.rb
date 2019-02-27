class AddCreatorToPaper < ActiveRecord::Migration[5.2]
  def change
    add_reference :papers, :creator, foreign_key: {to_table: :users}
  end
end
