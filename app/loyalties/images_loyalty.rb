class ImagesLoyalty
  attr_reader :user, :image

  def initialize user, image
    @user = user
    @image = image
  end

  def destroy?
    image.user.present? && image.user == user
  end

  # def upload?
  #   @user.is_admin?
  # end
end
