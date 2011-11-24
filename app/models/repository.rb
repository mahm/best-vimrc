class Repository < ActiveRecord::Base
  has_many :votes

  def self.display_order_by_score
    self.order("score DESC").all
  end

  def self.display_order_by_pushed_at
    self.order("repos_pushed_at DESC, score DESC").all
  end

  def vote(user)
    return nil unless user
    self.vote_count = self.votes.count + 1
    self.score = self.culc_score
    self.votes.build(:user_id => user.id)
    self
  end

  def voted?(user)
    self.votes.find_by_user_id(user) ? true : false
  end

  def culc_score
    (self.vote_count * 5) + self.watchers + self.forks
  end
end
