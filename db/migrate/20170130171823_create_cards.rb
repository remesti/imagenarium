class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :text
      t.attachment :audio

      t.timestamps
    end
  end
end
