class User < ActiveRecord::Base
  has_many :votes

  def self.create_user(auth)
    new_user = User.new(name: auth[:info][:name], provider: auth[:provider], uid: auth[:uid], auth: auth.to_yaml)
    new_user.save!
    new_user
  end

  def profile_image
    auth = YAML::load(self.auth)
    auth["info"]["image"]
  end
end
