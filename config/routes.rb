Rails.application.routes.draw do
  namespace :v1 do
    resources :diffs, :path => :diff, :defaults => { :format => :json } do
      member do
        post :left
        post :right
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
