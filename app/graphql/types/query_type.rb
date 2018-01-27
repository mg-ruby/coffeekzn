Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  field :shops, !types[Types::ShopType] do
    resolve -> (obj, args, ctx) {
      Shop.order(title: 'asc')
    }
  end
  field :shop do
    type Types::ShopType
    description "Find a Shop by SLUG"
    argument :id, !types.ID
    resolve ->(obj, args, ctx) { 
      resolve Rescuable.new ->(_object, args, _ctx) {
        Shop.find(args["id"])
      }  
    }
  end
end
