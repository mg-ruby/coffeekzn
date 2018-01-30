Types::RegistrationType = GraphQL::ObjectType.define do
  name 'Registration'
  field :phone do
    type types.String
    resolve -> (obj, args, ctx) {
      obj.phone
    }
  end
  field :address do
    type types.String
    resolve -> (obj, args, ctx) {
      obj.address
    }
  end

  field :location do
    type Types::LocationType
    resolve -> (obj, args, ctx) {
      obj.coordinates
    }
  end
end