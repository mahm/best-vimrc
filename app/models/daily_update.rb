module DailyUpdate
  def self.execute
    client = Octokit::Client.new
    # fetch 100 repositories
    remote_repos = client.search_repositories("vimrc")

    ActiveRecord::Base.transaction do
      remote_repos.each do |repo|
        rec = Repository.find_or_initialize_by_url(repo[:url])
        rec.username         = repo[:username]
        rec.homepage         = repo[:homepage]
        rec.name             = repo[:name]
        rec.description      = repo[:description]
        rec.watchers         = repo[:watchers]
        rec.followers        = repo[:followers]
        rec.forks            = repo[:forks]
        rec.repos_created_at = repo[:created_at]
        rec.repos_pushed_at  = repo[:pushed_at]
        rec.save
      end
    end
  end
end
