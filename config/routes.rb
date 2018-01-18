Rails.application.routes.draw do

  scope path: '/api', defaults: {format: :json} do
    scope path: '/v1' do
      resources :users, only: [:index, :show, :update]
      resources :sessions, only: [:create, :destroy]
      resources :boxes, only: [:update, :index, :show] do
        get :mini_program, to: 'posts#mini_program'
        resources :posts, only: [:create, :update, :index, :destroy]
      end

      scope path: '/search' do
        get :box, to: 'boxes#search'
        get :post, to: 'posts#search'
      end
    end
  end
  
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.use(Rack::Auth::Basic) { |user, pass| user == 'tech' && pass == 'Woshimima123' }
  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

  match '*path', to: 'errors#route_not_found', via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
