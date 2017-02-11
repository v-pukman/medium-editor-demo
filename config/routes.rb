Rails.application.routes.draw do
  mount MediumEditorInsertPlugin::Engine => "/medium-editor-insert-plugin"
  resources :pages
end
