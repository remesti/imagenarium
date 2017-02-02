class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :text, null: false
      t.attachment :audio, null: false

      t.timestamps
    end
  end
end
