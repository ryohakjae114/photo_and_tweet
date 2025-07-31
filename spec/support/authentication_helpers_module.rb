module AuthenticationHelpers
  def create_and_login_user(user_id: 'test_id', password: 'password')
    user = create(:user, user_id: user_id, password: password)
    login_as_user(user)
  end

  def login_as_user(user)
    visit new_session_path
    fill_in 'ユーザID', with: user.user_id
    fill_in 'パスワード', with: user.password
    click_on 'ログインする'
    expect(page).to have_content 'ログインしました'
  end
end
