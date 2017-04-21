class AddUserIdToSchichidaSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :schichida_sessions, :user_id, :integer
    add_index :schichida_sessions, :user_id
  end
end
