# This migration comes from medium_editor_insert_plugin (originally 20170207103411)
class CreateMediumEditorInsertPluginImages < ActiveRecord::Migration
  def change
    create_table :medium_editor_insert_plugin_images do |t|
      t.text :file
      t.timestamps
    end
  end
end
