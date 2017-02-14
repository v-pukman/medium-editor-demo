Rails.application.routes.draw do
  mount MediumEditorInsertPlugin::Engine => "/medium-editor-insert-plugin"
  devise_for :users
  resources :pages

  #post "/medium-editor-insert-plugin2/images/upload" => "medium_editor_insert_plugin/uploader#upload"
  #post "/medium-editor-insert-plugin2/images/delete" => "medium_editor_insert_plugin/uploader#delete"

  root to: "home#index"
end
