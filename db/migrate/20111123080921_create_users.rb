class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :provider
      t.text :auth, :limit => nil

      t.timestamps
    end
  end
end
