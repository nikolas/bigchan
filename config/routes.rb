Bigchan::Application.routes.draw do

  resources :spools do
    resources :bigups
  end

  root :to => "spools#index"

end
