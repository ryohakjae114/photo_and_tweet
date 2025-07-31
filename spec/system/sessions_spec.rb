require 'rails_helper'

RSpec.describe 'Sessions', type: :system do

  context '未ログイン時' do
    before do
      create(:user, user_id: 'test_id', password: 'password')
    end

    it 'ログインできること' do
      visit new_session_path

      fill_in 'ユーザID', with: 'test_id'
      fill_in 'パスワード', with: 'password'
      click_on 'ログインする'

      expect(page).to have_content 'ログインしました'
      expect(page).to have_current_path root_path
    end

    it 'ユーザIDが未入力の場合、ログイン画面が再表示されること' do
      visit new_session_path

      fill_in 'ユーザID', with: ''
      fill_in 'パスワード', with: '1234512345'
      click_on 'ログインする'

      expect(page).not_to have_content 'ログインしました'
      expect(page).to have_current_path new_session_path
    end

    it 'パスワードが未入力の場合、ログイン画面が再表示されること' do
      visit new_session_path

      fill_in 'ユーザID', with: 'test_id'
      fill_in 'パスワード', with: ''
      click_on 'ログインする'

      expect(page).not_to have_content 'ログインしました'
      expect(page).to have_current_path new_session_path
    end

    it 'ログインに失敗するとエラーメッセージが表示されること' do
      visit new_session_path

      fill_in 'ユーザID', with: 'test_id'
      fill_in 'パスワード', with: '1234512345'
      click_on 'ログインする'

      expect(page).to have_content 'ログインに失敗しました'
    end
  end

  context 'ログイン時' do
    before do
      create_and_login_user(user_id: 'test_id', password: 'password')
    end

    it 'ログアウトできること' do
      visit root_path
      click_button 'ログアウト'

      expect(page).to have_content 'ログアウトしました'
      expect(page).to have_current_path new_session_path
      expect(page).not_to have_button 'ログアウト'
    end
  end
end
