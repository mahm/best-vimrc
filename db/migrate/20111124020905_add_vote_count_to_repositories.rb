class AddVoteCountToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :vote_count, :integer, :default => 0
  end
end
