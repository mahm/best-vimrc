class Repository < ActiveRecord::Base
  has_many :votes

  def self.display_index
    self.order('pushed_at DESC')
  end
end
