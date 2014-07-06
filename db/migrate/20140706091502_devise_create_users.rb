class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name, null: false, default: ""
      t.string :nickname, null: false, default: ""
      t.timestamps
    end
    add_index :users, :name, unique: true
  end
end
