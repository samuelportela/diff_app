Rails.application.routes.draw do
  namespace :v1, :defaults => { :format => :json } do
    post 'diff/:id/left', to: 'diffs#left', as: :left_diff
    post 'diff/:id/right', to: 'diffs#right', as: :right_diff
    get 'diff/:id', to: 'diffs#show', as: :diff
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
