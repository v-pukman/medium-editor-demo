require_dependency MediumEditorInsertPlugin::Engine.config.root.join('app', 'models', 'medium_editor_insert_plugin', 'image.rb').to_s
# module MediumEditorInsertPlugin
#   class Image < ActiveRecord::Base
#     mount_uploader :file, ImageUploader
#     belongs_to :imageable, polymorphic: true
#   end
# end


class MediumEditorInsertPlugin::Image
  belongs_to :imageable, polymorphic: true
end

