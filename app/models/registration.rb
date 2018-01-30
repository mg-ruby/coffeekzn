class Registration
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :address, type: String
  field :phone, type: String
  
  field :coordinates, type: Array

  geocoded_by :address
  after_validation :geocode
  embedded_in :shop
end
