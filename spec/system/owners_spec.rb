require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER'] 
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '管理人新規登録', type: :system do
  before do
    @owner = FactoryBot.build(:owner)
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('管理人用リンク')
      # ログインページへ移動する
      visit new_owner_session_path
      # 新規登録ページに遷移するボタンがあることを確認する
      expect(page).to have_content('Forgot your password?')
      # 新規登録ページへ移動する
      visit new_owner_registration_path
      # ユーザー情報を入力する
      fill_in 'registration_firstname', with: @owner.firstname
      fill_in 'registration_lastname', with: @owner.lastname
      fill_in 'registration_email', with: @owner.email
      fill_in 'registration_password', with: @owner.password
      fill_in 'registration_password_confirmation', with: @owner.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Owner.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq '/owners'
      expect(page).to have_content('トップへ戻る')
      visit root_path
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('管理人用リンク')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('管理人用リンク')
      # ログインページへ移動する
      visit new_owner_session_path
      # 新規登録ページに遷移するボタンがあることを確認する
      expect(page).to have_content('Forgot your password?')
      # 新規登録ページへ移動する
      visit new_owner_registration_path
      # ユーザー情報を入力する
      fill_in 'registration_firstname', with: ''
      fill_in 'registration_lastname', with: ''
      fill_in 'registration_email', with: ''
      fill_in 'registration_password', with: ''
      fill_in 'registration_password_confirmation', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Owner.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq '/owners'
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @owner = FactoryBot.create(:owner)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('管理人用リンク')
      # ログインページへ移動する
      visit new_owner_session_path
      # 正しいユーザー情報を入力する
      fill_in 'registration_firstname', with: @owner.firstname
      fill_in 'registration_lastname', with: @owner.lastname
      fill_in 'registration_email', with: @owner.email
      fill_in 'registration_password', with: @owner.password
      fill_in 'registration_password_confirmation', with: @owner.password_confirmation
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq '/owners/sign_in'
      expect(page).to have_content('トップへ戻る')
      visit root_path
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('管理人用リンク')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('管理人用リンク')
      # ログインページへ移動する
      visit new_owner_session_path
      # ユーザー情報を入力する
      fill_in 'registration_firstname', with: ''
      fill_in 'registration_lastname', with: ''
      fill_in 'registration_email', with: ''
      fill_in 'registration_password', with: ''
      fill_in 'registration_password_confirmation', with: ''
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq new_owner_session_path
    end
  end
end
