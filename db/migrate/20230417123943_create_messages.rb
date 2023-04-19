class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :user_id_from
      t.integer :user_id_to
      t.text :message
      t.timestamps
    end
  end
end
