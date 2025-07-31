require 'rails_helper'

RSpec.describe PhotosHelper, type: :helper do
  describe '#can_tweet?' do
    it 'sessionにツイートアプリのアクセストークンが存在すれば、trueになること' do
      session[:access_token] = 'token'
      expect(can_tweet?).to eq true
    end

    it 'sessionにツイートアプリのアクセストークンが存在すれば、falseになること' do
      session[:access_token] = nil
      expect(can_tweet?).to eq false
    end
  end
end
