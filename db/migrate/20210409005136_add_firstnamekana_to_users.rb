class AddFirstnamekanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_kana, :string, null: false
  end
end
