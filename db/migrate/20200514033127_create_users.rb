class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 100, null: false
      t.string :password_digest
      t.string :nickname, limit: 100
      t.timestamps
    end
  end
end
