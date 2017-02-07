class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :image, null: false
      t.references :content, null: false

      t.timestamps
    end
  end
end
