class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string  :url
      t.string  :username
      t.string  :homepage
      t.string  :name
      t.string  :description
      t.integer :watchers
      t.integer :followers
      t.integer :forks
      t.date    :repos_created_at
      t.date    :repos_pushed_at

      t.timestamps
    end
  end
end
