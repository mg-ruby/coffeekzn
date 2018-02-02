Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get '/files/grid/shop/preview_image/:id/:filename' => 'gridfs#preview_image', as: 'grid_image'
end
