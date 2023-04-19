class AddViewCountToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :viewcount, :integer
  end
end
