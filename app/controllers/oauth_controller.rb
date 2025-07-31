class OauthController < ApplicationController
  def authorize
    request_params =
      {
        scope: 'write_tweet',
        redirect_uri: Rails.application.credentials.my_tweet_app[:redirect_uri],
        client_id: Rails.application.credentials.my_tweet_app[:client_id],
        response_type: 'code',
      }

    redirect_to "http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/oauth/authorize?#{URI.encode_www_form(request_params)}",
                allow_other_host: true
  end

  def callback
    request_params =
      {
        grant_type: 'authorization_code',
        code: params[:code],
        client_id: Rails.application.credentials.my_tweet_app[:client_id],
        client_secret: Rails.application.credentials.my_tweet_app[:client_secret],
        redirect_uri: Rails.application.credentials.my_tweet_app[:redirect_uri],
      }
    uri = URI('http://unifa-recruit-my-tweet-app.ap-northeast-1.elasticbeanstalk.com/oauth/token')
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request_post(uri.request_uri, URI.encode_www_form(request_params), headers)
    session[:access_token] = JSON.parse(response.body)['access_token']

    redirect_to root_path, notice: 'MyTweetApp連携しました'
  end
end
