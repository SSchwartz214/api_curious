class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :login
      t.string :email
      t.string :image
      t.string :name
      t.string :repos
      t.string :nickname
      t.string :token

      t.timestamps
    end
  end
end
