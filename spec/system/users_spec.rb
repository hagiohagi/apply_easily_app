require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload('/files/test_image.png')
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ユーザー登録')
      # ログインページへ移動する
      visit step1_informations_path
      # ユーザー情報を入力する
      fixture_file_upload '/files/test_image.png'
      fill_in 'registration_firstname', with: @user.firstname
      fill_in 'registration_lastname', with: @user.lastname
      fill_in 'registration_firstname_kana', with: @user.firstname_kana
      fill_in 'registration_lastname_kana', with: @user.lastname_kana
      fill_in 'registration_email', with: @user.email
      choose '男性'
      fill_in 'registration_password', with: @user.password
      fill_in 'registration_password_confirmation', with: @user.password_confirmation
      select '1989', from: 'user[birth_day(1i)]'
      select '12', from: 'user[birth_day(2i)]'
      select '12', from: 'user[birth_day(3i)]'
      fill_in 'registration_phone_number', with: @user.phone_number
      # 続けて記入するボタンを押すとsessionに値を保持し次のページに移動する
      click_on '続けて記入する'
      expect(current_path).to eq step2_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_postal_code', with: @user.postal_code
      select '北海道'
      fill_in 'registration_city', with: @user.city
      fill_in 'registration_building', with: @user.building
      # 続けて記入するボタンを押すとsessionに値を保持し次のページに移動する
      click_on '続けて記入する'
      expect(current_path).to eq step3_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_highschool', with: @user.highschool
      select '2000', from: 'user_h_admission'
      select '2000', from: 'user_h_graduate'
      fill_in 'registration_univercity', with: @user.univercity
      select '2000', from: 'user_u_admission'
      select '2000', from: 'user_u_graduate'
      fill_in 'registration_job_experience', with: @user.job_experience
      fill_in 'registration_qualification_1', with: @user.qualification_1
      select '2000', from: 'user_q_year_1'
      fill_in 'registration_qualification_2', with: @user.qualification_2
      select '2000', from: 'user_q_year_2'
      fill_in 'registration_qualification_3', with: @user.qualification_3
      select '2000', from: 'user_q_year_3'
      fill_in 'registration_station', with: @user.station
      choose 'あり'
      # 登録するボタンを押すと次のページに移動する
      click_on '登録する'
      find('input[name="submit"]').click
      expect(current_path).to eq done_informations_path
    end

    it '正しい情報を入力すれば最終確認画面で修正するを選択する事で入力画面に戻ることができる' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ユーザー登録')
      # ログインページへ移動する
      visit step1_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_firstname', with: @user.firstname
      fill_in 'registration_lastname', with: @user.lastname
      fill_in 'registration_firstname_kana', with: @user.firstname_kana
      fill_in 'registration_lastname_kana', with: @user.lastname_kana
      fill_in 'registration_email', with: @user.email
      choose '男性'
      fill_in 'registration_password', with: @user.password
      fill_in 'registration_password_confirmation', with: @user.password_confirmation
      select '1989', from: 'user[birth_day(1i)]'
      select '12', from: 'user[birth_day(2i)]'
      select '12', from: 'user[birth_day(3i)]'
      fill_in 'registration_phone_number', with: @user.phone_number
      # 続けて記入するボタンを押すとsessionに値を保持し次のページに移動する
      click_on '続けて記入する'
      expect(current_path).to eq step2_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_postal_code', with: @user.postal_code
      select '北海道'
      fill_in 'registration_city', with: @user.city
      fill_in 'registration_building', with: @user.building
      # 続けて記入するボタンを押すとsessionに値を保持し次のページに移動する
      click_on '続けて記入する'
      expect(current_path).to eq step3_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_highschool', with: @user.highschool
      select '2000', from: 'user_h_admission'
      select '2000', from: 'user_h_graduate'
      fill_in 'registration_univercity', with: @user.univercity
      select '2000', from: 'user_u_admission'
      select '2000', from: 'user_u_graduate'
      fill_in 'registration_job_experience', with: @user.job_experience
      fill_in 'registration_qualification_1', with: @user.qualification_1
      select '2000', from: 'user_q_year_1'
      fill_in 'registration_qualification_2', with: @user.qualification_2
      select '2000', from: 'user_q_year_2'
      fill_in 'registration_qualification_3', with: @user.qualification_3
      select '2000', from: 'user_q_year_3'
      fill_in 'registration_station', with: @user.station
      choose 'あり'
      # 登録するボタンを押すと次のページに移動する
      click_on '登録する'
      find('input[name="back"]').click
      expect(current_path).to eq informations_path
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる(1ページ目)' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ユーザー登録')
      # ログインページへ移動する
      visit step1_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_firstname', with: ''
      fill_in 'registration_lastname', with: ''
      fill_in 'registration_firstname_kana', with: ''
      fill_in 'registration_lastname_kana', with: ''
      fill_in 'registration_email', with: ''
      choose '男性'
      fill_in 'registration_password', with: ''
      fill_in 'registration_password_confirmation', with: ''
      select '1989', from: 'user[birth_day(1i)]'
      select '12', from: 'user[birth_day(2i)]'
      select '12', from: 'user[birth_day(3i)]'
      fill_in 'registration_phone_number', with: ''
      # 続けて記入するボタンを押しても次へ進まない
      click_on '続けて記入する'
      expect(current_path).to eq step2_informations_path
    end

    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる(2ページ目)' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ユーザー登録')
      # ログインページへ移動する
      visit step1_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_firstname', with: @user.firstname
      fill_in 'registration_lastname', with: @user.lastname
      fill_in 'registration_firstname_kana', with: @user.firstname_kana
      fill_in 'registration_lastname_kana', with: @user.lastname_kana
      fill_in 'registration_email', with: @user.email
      choose '男性'
      fill_in 'registration_password', with: @user.password
      fill_in 'registration_password_confirmation', with: @user.password_confirmation
      select '1989', from: 'user[birth_day(1i)]'
      select '12', from: 'user[birth_day(2i)]'
      select '12', from: 'user[birth_day(3i)]'
      fill_in 'registration_phone_number', with: @user.phone_number
      # 続けて記入するボタンを押すとsessionに値を保持し次のページに移動する
      click_on '続けて記入する'
      expect(current_path).to eq step2_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_postal_code', with: ''
      select '北海道'
      fill_in 'registration_city', with: ''
      fill_in 'registration_building', with: ''
      # 続けて記入するボタンを押しても次へ進まない
      click_on '続けて記入する'
      expect(current_path).to eq step3_informations_path
    end

    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる(3ページ目)' do
      # Basic認証を通過する
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ユーザー登録')
      # ログインページへ移動する
      visit step1_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_firstname', with: @user.firstname
      fill_in 'registration_lastname', with: @user.lastname
      fill_in 'registration_firstname_kana', with: @user.firstname_kana
      fill_in 'registration_lastname_kana', with: @user.lastname_kana
      fill_in 'registration_email', with: @user.email
      choose '男性'
      fill_in 'registration_password', with: @user.password
      fill_in 'registration_password_confirmation', with: @user.password_confirmation
      select '1989', from: 'user[birth_day(1i)]'
      select '12', from: 'user[birth_day(2i)]'
      select '12', from: 'user[birth_day(3i)]'
      fill_in 'registration_phone_number', with: @user.phone_number
      # 続けて記入するボタンを押すとsessionに値を保持し次のページに移動する
      click_on '続けて記入する'
      expect(current_path).to eq step2_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_postal_code', with: @user.postal_code
      select '北海道'
      fill_in 'registration_city', with: @user.city
      fill_in 'registration_building', with: @user.building
      # 続けて記入するボタンを押すとsessionに値を保持し次のページに移動する
      click_on '続けて記入する'
      expect(current_path).to eq step3_informations_path
      # ユーザー情報を入力する
      fill_in 'registration_highschool', with: ''
      select '2000', from: 'user_h_admission'
      select '2000', from: 'user_h_graduate'
      fill_in 'registration_univercity', with: ''
      select '2000', from: 'user_u_admission'
      select '2000', from: 'user_u_graduate'
      fill_in 'registration_job_experience', with: ''
      fill_in 'registration_qualification_1', with: ''
      select '2000', from: 'user_q_year_1'
      fill_in 'registration_qualification_2', with: ''
      select '2000', from: 'user_q_year_2'
      fill_in 'registration_qualification_3', with: ''
      select '2000', from: 'user_q_year_3'
      fill_in 'registration_station', with: ''
      choose 'あり'
      # 登録するボタンを押しても登録されず最後の入力画面に戻ってしまう
      click_on '登録する'
      expect(current_path).to eq confirm_informations_path
    end
  end
end
