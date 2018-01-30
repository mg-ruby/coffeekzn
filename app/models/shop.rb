class Shop
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid
  include Mongoid::Slug
  include Mongoid::Tags

  field :email, type: String
  field :title, type: String
  field :description, type: String

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

  mount_uploader :preview_image, PreviewImageUploader

  slug :title

  embeds_many :registrations

  scope :ordered, -> { order('created_at DESC') }

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
end
