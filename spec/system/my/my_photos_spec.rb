require 'rails_helper'

RSpec.describe 'My::Photos', type: :system do
  describe '写真一覧' do
    context 'ログイン時' do
      let!(:user) { create(:user) }

      before do
        login_as_user(user)
      end

      after do
        logout_user
      end

      it '写真一覧画面作成日の降順で表示されること' do
        create(:photo, user:, title: '写真1', image: file_fixture('hakjae.png'))
        create(:photo, user:, title: '写真2', image: file_fixture('highball.JPG'))
        create(:photo, user:, title: '写真3', image: file_fixture('steak.jpg'))

        visit root_path
        expect(page).to have_content '写真一覧'
        expect(page).to have_content '写真'
        within find('.col-6')[0] do
          expect(page).to have_content '写真3'
          expect(page).to have_selector("img[src*='steak.jpg']")
        end
        within find('.col-6')[1] do
          expect(page).to have_content '写真2'
          expect(page).to have_selector("img[src*='highball.JPG']")
        end
        within find('.col-6')[2] do
          expect(page).to have_content '写真1'
          expect(page).to have_selector("img[src*='hakjae.png']")
        end
      end

      it '他の人の写真は表示されないこと' do
      end

      it '写真アップロード画⾯にアクセスできること' do
      end
    end

    context '未ログイン時' do
      it '写真一覧画面にアクセスすると、ログイン画面にリダイレクトされること' do
        visit root_path

        expect(page).to have_current_path new_session_path
      end
    end
  end

  describe '写真アップロード' do
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
end
