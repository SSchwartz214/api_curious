class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :image
      t.string :name
      t.string :repos
      t.string :nickname
      t.string :token
      t.string :refresh_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
