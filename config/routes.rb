Rails.application.routes.draw do

  scope path: '/api', defaults: {format: :json} do
    scope path: '/v1' do
      resources :users, only: [:index, :show, :update] do
        get :upload_res_token
        get :uri_parser
      end
      get :me, to: 'users#me'

      resources :sessions, only: [:create, :destroy]
      resources :boxes, only: [:update, :show] do
        post :generate_qrcode_token
        resources :posts, only: [:create, :update, :index, :show, :destroy] do
          post :copy, to: 'posts#copy'
        end
      end
      get :following_boxes, to: 'boxes#following_boxes'
      get :movement, to: 'posts#movement'

      resources :box_followers, only: [:create, :update, :destroy, :index]
      
      scope path: '/mini_program' do
        get :index, to: 'mini_program#index'
        get :show, to: 'mini_program#show'
      end

      scope path: '/search' do
        get :box_followers, to: 'search#box_followers'
        get :boxes, to: 'search#boxes'
        get :posts, to: 'search#posts'
        get :all, to: 'search#all'
      end

      get :wx_unified_order, to: 'wx#unified_order'
      get :wx_notify_unified_order, to: 'wx#notify_unified_order'

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
