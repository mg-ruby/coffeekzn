Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  #get '/uploads/grid/shop/preview_image/:id/:filename', to: 'gridfs#preview_image', as: 'grid_image'
  #get "/shops/:id/preview_image" => "gridfs#serve", as: 'grid_image'
  get '/uploads/grid/shop/preview_image/:id/:filename' => 'gridfs#preview_image', as: 'grid_image'
end
