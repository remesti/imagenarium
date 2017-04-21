class AddLanguagesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :site_language_id, :integer
    add_column :users, :cards_language_id, :integer
    add_column :users, :schichida, :boolean
    add_column :users, :doman, :boolean
    add_column :users, :math, :boolean
  end
end
