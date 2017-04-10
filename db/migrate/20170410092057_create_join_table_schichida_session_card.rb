class CreateJoinTableSchichidaSessionCard < ActiveRecord::Migration[5.0]
  def change
    create_join_table :schichida_sessions, :cards do |t|
      t.index [:schichida_session_id, :card_id], name: 'idx_cards_ss_on_schichida_session_id_and_card_id'
      t.index [:card_id, :schichida_session_id], name: 'idx_cards_ss_on_card_id_and_schichida_session_id'
    end
  end
end
