class Repository < ActiveRecord::Base
  has_many :votes

  def self.display_with_vote_count
    sql = <<-EOS
      SELECT repositories.id
      ,      COUNT(votes.id) AS vote_count
      ,      url
      ,      username
      ,      homepage
      ,      name
      ,      description
      ,      watchers
      ,      followers
      ,      forks
      ,      repos_created_at
      ,      repos_pushed_at
      FROM   repositories LEFT OUTER JOIN votes
             ON repositories.id = votes.repository_id
      GROUP BY  url
      ,      username
      ,      homepage
      ,      name
      ,      description
      ,      watchers
      ,      followers
      ,      forks
      ,      repos_created_at
      ,      repos_pushed_at
    EOS
    self.find_by_sql(sql)
  end

  def vote(user)
    return nil unless user
    self.votes.build
    self
  end
end
