Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  field :shops, !types[Types::ShopType] do
    resolve -> (obj, args, ctx) {
      Shop.order(title: 'asc')
    }
  end
  field :shop do
    type Types::ShopType
    argument :id, !types.ID
    description "Find a Shop by SLUG"
    resolve ->(obj, args, ctx) { Shop.find(args["id"]) }
  end
end
