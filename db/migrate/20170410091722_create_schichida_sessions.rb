class CreateSchichidaSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :schichida_sessions do |t|

      t.timestamps
    end
  end
end
