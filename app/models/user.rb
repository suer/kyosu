class User < ActiveRecord::Base
  devise :omniauthable

  def self.find_or_create(name, nickname)
    user = User.where(name: name).first || User.new(name: name)
    user.nickname = nickname
    user.save!
    user
  end
end
