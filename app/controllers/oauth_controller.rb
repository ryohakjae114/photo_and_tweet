class OauthController < ApplicationController
  def authorize
    params =
      {
        scope: Rails.application.credentials.my_tweet_app[:scope],
        redirect_uri: Rails.application.credentials.my_tweet_app[:redirect_uri],
        client_id: Rails.application.credentials.my_tweet_app[:client_id],
        response_type: Rails.application.credentials.my_tweet_app[:response_type],
      }
    redirect_to "http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/oauth/authorize?#{URI.encode_www_form(params)}", allow_other_host: true
  end

  def callback
    session[:my_tweet_app_token] = params[:code]
    redirect_to root_path, notice: 'MyTweetApp連携しました'
  end
end
