#overriding docs

#https://gist.github.com/schneikai/d8fc1b3889044804459f
#http://edgeguides.rubyonrails.org/engines.html#overriding-models-and-controllers

#require_dependency MediumEditorInsertPlugin::Engine.config.root.join('app', 'controllers', 'medium_editor_insert_plugin', 'images_controller.rb').to_s
# MediumEditorInsertPlugin::ImagesController.class_eval do
# end

#all these methods dont work here
#try again maybe later

module MediumEditorInsertPlugin
  class ImagesController < ApplicationController
    include Banken
    before_action :authenticate_user!
    before_action :authorize, only: :delete

    def upload
      @image = build_image
      @image.file = image_file

      if @image.save
        render json: { success: true, files: [{ url: "#{@image.file.url}?id=#{@image.id}" }] }
      else
        render json: { success: false, errors:  @image.errors }, status: :unprocessable_entity
      end
    end

    # insert-plugin is locked on file path of image and it's hard to pass other params
    # for now pass id to file path on uploading and get it on deleting
    def delete
      @image = find_image
      @image.destroy
      render json: { success: true }
    end

    protected

    def build_image
      current_user.images.build
    end

    def find_image
      current_user.images.find image_id
    end

    def authorize
      raise "not authorized" unless ImagesLoyalty.new(current_user, find_image).destroy?
    end

    def image_id
      file = params.require(:file)
      file.split("?")[1].to_s.gsub("id=", "")
    end

    def image_file
      files = params.require(:files)
      files[0]
    end

  end
end
