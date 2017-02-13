Rails.application.routes.draw do
  devise_for :users
  #mount MediumEditorInsertPlugin::Engine => "/medium-editor-insert-plugin"
  resources :pages

  post "images/upload" => "images#upload"
  post "images/delete" => "images#delete"

  root to: "home#index"
end
