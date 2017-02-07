class CreateJoinTableCardSessionCard < ActiveRecord::Migration[5.0]
  def change
    create_join_table :card_sessions, :cards do |t|
      t.index [:card_session_id, :card_id]
      t.index [:card_id, :card_session_id]
    end
  end
end
