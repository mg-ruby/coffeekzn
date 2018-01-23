class Shop
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid
  include Mongoid::Slug
  include Mongoid::Tags

  field :email, type: String
  field :title, type: String
  field :description, type: String
  field :address, type: String
  field :preview_image, type: String
  field :coordinates, type: Array

  field :vk, type: String
  field :facebook, type: String
  field :twitter, type: String
  field :instagram, type: String
  field :website, type: String

  field :working_hours, type: String
  field :phone, type: String

  field :espresso_price, type: String
  field :cappuccino_price, type: String
  field :roasting, type: String
  field :features, type: String
  field :coffee_machine, type: String
  field :sell_in_beans, type: Boolean, default: false
  field :alternate, type: Boolean, default: false
  field :merchandise, type: Boolean, default: false

  slug :title

  geocoded_by :address
  after_validation :geocode

  scope :ordered, -> { order('created_at DESC') }

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
end
