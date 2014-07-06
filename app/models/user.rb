class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :omniauthable

  field :name
  field :nickname

  # avoid error 10068: "invalid operator: $oid"
  # see https://github.com/plataformatec/devise/issues/2949
  class << self
    def serialize_from_session(key, salt)
      record = to_adapter.get(key[0]["$oid"])
      record if record && record.authenticatable_salt == salt
    end
  end

  def self.find_or_create(name, nickname)
    user = User.where(name: name).first || User.new(name: name)
    user.nickname = nickname
    user.save!
    user
  end
end
