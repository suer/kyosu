class App
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :guid, type: String
  belongs_to :user

  after_create :generate_guid

  validates :title, presence: true

  def generate_guid
    uuid = SecureRandom.uuid.split('-').join
    uuid << Time.now.strftime("%Y%m%d%H%M%S%L") unless App.where(guid: uuid).first.nil?
    self.guid = uuid
    save
  end
end
