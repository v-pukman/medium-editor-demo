class AddResourceToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :medium_editor_insert_plugin_images, :imageable_id, :integer
    add_column :medium_editor_insert_plugin_images, :imageable_type, :string
    add_index :medium_editor_insert_plugin_images, [:imageable_id, :imageable_type], name: "imageable_index"
  end
end
