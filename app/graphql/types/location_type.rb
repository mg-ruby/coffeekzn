Types::LocationType = GraphQL::ObjectType.define do
  name 'Location'
  field :lat do
    type types.Float
    resolve -> (obj, args, ctx) {
      obj[1]
    }
  end
  field :lng do
    type types.Float
    resolve -> (obj, args, ctx) {
      obj[0]
    }
  end
end