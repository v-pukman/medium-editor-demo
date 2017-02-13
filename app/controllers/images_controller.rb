class ImagesController < MediumEditorInsertPlugin::ImagesController
  include Banken
  #before_action :authenticate_user!
  #before_action :authorize, only: [:delete]

  def authorize
    authorize! @image
  end

  def build_image
    @image = current_user.images.build
  end

  def find_image
    @image = current_user.images.find image_id
  end


  # def delete
  #   super
  # end

  # private
  #protected


end
