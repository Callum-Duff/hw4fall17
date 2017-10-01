class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.string :email
      t.string :session_token
      t.timestamps
    end
  end
end
