module PhotosHelper
  def can_tweet?
    session[:access_token].present?
  end
end
