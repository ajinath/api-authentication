Rails.application.routes.draw do
  namespace :api  do
    namespace :v1, defaults: {format: :json} do
      get '/search' => "home#search"
    end
  end
end
