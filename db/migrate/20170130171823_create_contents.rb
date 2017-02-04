class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :text, null: false
      t.attachment :audio, null: false

      t.timestamps
    end
  end
end
