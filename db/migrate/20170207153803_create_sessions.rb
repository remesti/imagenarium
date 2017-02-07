class CreateCardSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :card_sessions do |t|
      t.timestamps
    end
  end
end
