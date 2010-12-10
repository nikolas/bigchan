Bigchan::Application.routes.draw do

  resources :spools do
    resources :bigups
  end

  root :to => "spools#index"

  match ':id' => 'spools#show', :constraints => { :id => /\d*/ }
  match ':spool_id/:id' => 'bigups#show', :constraints => { :spool_id => /\d*/, :id => /\d*/ }

end
