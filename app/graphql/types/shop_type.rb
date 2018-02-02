Types::ShopType = GraphQL::ObjectType.define do
  name 'Shop'

  field :id, !types.ID
  field :email, types.String

  field :instagram, types.String
  field :vk, types.String
  field :facebook, types.String
  field :twitter, types.String
  field :website, types.String

  field :title, !types.String
  field :description, !types.String
  field :working_hours, !types.String
  field :espresso_price, types.String
  field :cappuccino_price, types.String
  field :roasting, types.String
  field :features, types.String
  field :coffee_machine, types.String
  field :sell_in_beans, types.Boolean
  field :alternate, types.Boolean
  field :merchandise, types.Boolean
  field :tags, types[types.String]

  field :slug, types.String

  field :registrations, types[Types::RegistrationType]

  field :preview_image do
    type types.String
    resolve -> (obj, args, ctx) {
      sibdir = obj.preview_image.file ? '/' : '/uploads'
      "http://#{ENV['STORAGE_SERVER']}#{sibdir}#{obj.preview_image.url}"
    }
  end

  field :updated_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.updated_at.to_i
    }
  end

  field :created_at do
    type types.Int

    resolve -> (obj, args, ctx) {
      obj.created_at.to_i
    }
  end
end