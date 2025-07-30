require 'rails_helper'

RSpec.describe 'My::Photos', type: :system do
  context 'ログイン時' do
    before do
      create_and_login_user(user_id: 'test_id', password: 'password')
    end

    after do
      logout_user
    end

    it '写真アップロード画面から写真を投稿できること' do
      visit new_my_photo_path
      fill_in 'タイトル', with: '息子のゴールシーン'
      attach_file '写真', file_fixture('hakjae.png')
      expect do
        click_on '投稿する'
        expect(page).to have_content '投稿しました'
      end.to change(Photo, :count).by(1)

      expect(page).to have_current_path root_path
    end

    it 'タイトルが未入力の場合、投稿できないこと' do
      visit new_my_photo_path
      fill_in 'タイトル', with: ''
      attach_file '写真', file_fixture('hakjae.png')
      expect do
        click_on '投稿する'
      end.not_to change(Photo, :count)

      expect(page).not_to have_content '投稿しました'
      expect(page).to have_current_path new_my_photo_path
    end

    it '画像が未入力の場合、エラーが表示されること' do
      visit new_my_photo_path
      fill_in 'タイトル', with: '息子のゴールシーン'
      expect do
        click_on '投稿する'
      end.not_to change(Photo, :count)

      expect(page).not_to have_content '投稿しました'
      expect(page).to have_current_path new_my_photo_path
    end

    it 'キャンセルのリンクから写真一覧画面に遷移できること' do
      visit new_my_photo_path

      click_on 'キャンセル'
      expect(page).to have_current_path root_path
    end
  end

  context '未ログイン時' do
    it '写真アップロード画面にアクセスすると、ログイン画面にリダイレクトされること' do
      visit new_my_photo_path

      expect(page).to have_current_path new_session_path
    end
  end
end
