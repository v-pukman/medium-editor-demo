class PagesLoyalty
  attr_reader :user, :page

  def initialize user, page
    @user = user
    @page = page
  end

  def update?
    page.user.present? && page.user == user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
