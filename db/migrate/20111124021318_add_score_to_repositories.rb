class AddScoreToRepositories < ActiveRecord::Migration
  def up
    add_column :repositories, :score, :integer
    repos = Repository.all
    ActiveRecord::Base.transaction do
      repos.each do |repo|
        repo.score = repo.watchers + repo.forks
        repo.save
      end
    end
  end
  def down
    remove_column :repositories, :score
  end
end
