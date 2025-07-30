module AuthenticationHelpers
  def create_and_login_user(user_id: 'test_id', password: 'password')
    create(:user, user_id: user_id, password: password)
    login_as_user(user_id, password)
  end

  def login_as_user(user_id, password)
    visit new_session_path
    fill_in 'ユーザID', with: user_id
    fill_in 'パスワード', with: password
    click_on 'ログインする'
    expect(page).to have_content 'ログインしました'
  end

  def logout_user
    click_on 'ログアウト'
    expect(page).to have_content 'ログアウトしました'
  end
end
