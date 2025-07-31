class My::Photos::TweetsController < ApplicationController
  def create
    @photo = Current.user.photos.find(params[:photo_id])
    uri = URI('http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/api/tweets')
    http = Net::HTTP.new(uri.host, uri.port)
    http.request_post(uri.request_uri, URI.encode_www_form({ text: @photo.title, url: url_for(@photo.image) }),
                      Authorization: "Bearer #{session[:access_token]}")
    redirect_to root_path, notice: 'ツイートアプリに投稿しました'
  end
end
