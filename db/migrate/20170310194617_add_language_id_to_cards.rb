class AddLanguageIdToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :language_id, :integer
  end
end
