class AddDatesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :dates, :date
  end
end
