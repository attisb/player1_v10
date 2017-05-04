Rails.application.routes.draw do

  namespace :dashboard do
    get 'admin-drinks', to: 'pages#drink'
    get 'admin-screens', to: 'pages#screen'
    get 'admin-games', to: 'pages#games'
    get 'admin-events', to: 'pages#events'
    get 'availables', to: 'available#index'
    get 'drafts', to: 'drafts#index'
    get 'home', to: 'pages#index'
    get 'search', to: 'search#index'
    post 'search', to: 'search#results'
    resources :assets
    resources :beer_groups
    resources :beer_styles
    resources :beer_sizes
    resources :breweries
    resources :drinks
    resources :categories
    resources :events
    resources :games
    resources :playlists
    resources :playlist_orders, :only => [:create, :update, :destroy]
    resources :screen_orders, :only => [:create, :update, :destroy]
    resources :products, :path => 'merchandise'
    resources :screens
    resources :users, :except => [:new, :create]
  end

  get 'cities/:state',              to: 'application#cities'
  get 'drinks',                     to: 'pages#drinks'
  get 'drinks/styles',              to: 'pages#drinks', as: 'drinks_styles',         :defaults => { :type => 'styles' }
  get 'drinks/breweries',           to: 'pages#drinks', as: 'drinks_brewery',        :defaults => { :type => 'brewery' }
  get 'drinks/countries',           to: 'pages#drinks', as: 'drinks_country',        :defaults => { :type => 'country' }
  get 'drinks/states',              to: 'pages#drinks', as: 'drinks_state',          :defaults => { :type => 'state' }
  get 'drinks/breweries/:id',       to: 'pages#drinks', as: 'drinks_brewery_letter', :defaults => { :type => 'brewery', :by_letter => true }
  get 'drinks/country/:id',         to: 'pages#drinks', as: 'drinks_country_letter', :defaults => { :type => 'country', :by_letter => true }

  get 'games/by/system/:id',        to: 'games#index', as: 'games_system', :defaults => { :type => 'system' }
  get 'games/by/category/:console/:id',      to: 'games#index', as: 'games_category', :defaults => { :type => 'category' }
  get 'games/by/name/:id',          to: 'games#show', as: 'games_by_name'

  get 'prints',                     to: 'prints#index'
  get 'prints/drafts',              to: 'prints#drafts'
  get 'prints/bottles',             to: 'prints#bottles'
  get 'prints/full',                to: 'prints#full'
  get 'prints/glass/:id',           to: 'prints#glass', as: 'prints_glass'
  get 'prints/games/:id',           to: 'prints#game',  as: 'prints_game'
  get 'rules',                      to: 'pages#rules'
  get 'rules/terms',                to: 'pages#terms'
  get 'rules/privacy',              to: 'pages#privacy'
  
  get 'drinks/by/draft',            to: 'drinks#index', as: 'drinks_by_draft',   :defaults => { :type => 'draft' }
  get 'drinks/by/bottle',           to: 'drinks#index', as: 'drinks_by_bottle',  :defaults => { :type => 'bottle' }
  get 'drinks/latest',              to: 'drinks#index', as: 'drinks_latest',     :defaults => { :type => 'latest' }
  get 'drinks/coming-soon',         to: 'drinks#index', as: 'drinks_soon',       :defaults => { :type => 'soon' }
  get 'drinks/special',             to: 'drinks#index', as: 'drinks_special',    :defaults => { :type => 'special' }

  get 'drinks/by/group/:id',        to: 'drinks#index', as: 'drinks_by_group',   :defaults => { :type => 'group' }
  get 'drinks/by/style/:id',        to: 'drinks#index', as: 'drinks_by_style',   :defaults => { :type => 'styles' }
  get 'drinks/by/brewery/:id',      to: 'drinks#index', as: 'drinks_by_brewery', :defaults => { :type => 'brewery' }
  get 'drinks/by/country/:id',      to: 'drinks#index', as: 'drinks_by_country', :defaults => { :type => 'country' }
  get 'drinks/by/state/:id',        to: 'drinks#index', as: 'drinks_by_state',   :defaults => { :type => 'state' }
  get 'drinks/by/color/:color',     to: 'drinks#index', as: 'drinks_by_color',   :defaults => { :type => 'color' }
  get 'drinks/by/name/:id',         to: 'drinks#show',  as: 'drinks_by_name',    :defaults => { :type => 'name' }
  
  get 'track/had/:id',              to: 'user_tracks#track_had', as: 'track_had'
  get 'track/want/:id',             to: 'user_tracks#track_want', as: 'track_want'
  get 'track/not/had/:id',          to: 'user_tracks#not_track_had', as: 'not_track_had'
  get 'track/not/want/:id',         to: 'user_tracks#not_track_want', as: 'not_track_want'
    
  get '/screens/kiosk-list/:codeword/list', to: 'screens#list', as: 'screen_kiosk_list'
  get '/screens/kiosk-menu/:codeword/menu', to: 'screens#menu', as: 'screen_kiosk_menu'
  get '/screens/kiosk-menu/:codeword/game', to: 'screens#game', as: 'screen_kiosk_game'

  resources :users, controller: 'users'
  resources :events, :only => [:index, :show]  
  resources :games, :only => [:index, :show]  
  resources :products, :controller => "store", :path => "merch", :only => [:index, :show]
  
  resources :notes, :except => [:index, :show, :destroy]
    
  root 'pages#index'

end
