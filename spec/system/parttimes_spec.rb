require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER'] 
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '面接データ登録', type: :system do
  before do
    @parttime = FactoryBot.build(:parttime)
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload('/files/test_image.jpg')
  end
  context 'データ登録ができるとき' do
    it 'ユーザー登録を経由してデータを登録する' do
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
      # 登録するボタンを押すと確認画面を経て登録処理が完了しログイン画面に入る
      click_on '登録する'
      find('input[name="submit"]').click
      expect(current_path).to eq done_informations_path
      visit new_parttime_path
      # 面接に使う情報を入力する
      fill_in 'registration_sun_parttime_in', with: @parttime.sun_parttime_in
      fill_in 'registration_sun_parttime_out', with: @parttime.sun_parttime_out
      fill_in 'registration_mon_parttime_in', with: @parttime.mon_parttime_in
      fill_in 'registration_mon_parttime_out', with: @parttime.mon_parttime_out
      fill_in 'registration_tue_parttime_in', with: @parttime.tue_parttime_in
      fill_in 'registration_tue_parttime_out', with: @parttime.tue_parttime_out
      fill_in 'registration_wed_parttime_in', with: @parttime.wed_parttime_in
      fill_in 'registration_wed_parttime_out', with: @parttime.wed_parttime_out
      fill_in 'registration_thu_parttime_in', with: @parttime.thu_parttime_in
      fill_in 'registration_thu_parttime_out', with: @parttime.thu_parttime_out
      fill_in 'registration_fri_parttime_in', with: @parttime.fri_parttime_in
      fill_in 'registration_fri_parttime_out', with: @parttime.fri_parttime_out
      fill_in 'registration_sat_parttime_in', with: @parttime.sat_parttime_in
      fill_in 'registration_sat_parttime_out', with: @parttime.sat_parttime_out
      fill_in 'registration_pr_1', with: @parttime.pr_1
      fill_in 'registration_pr_2', with: @parttime.pr_2
      fill_in 'registration_pr_3', with: @parttime.pr_3
      # 登録するボタンを押すと確認画面を経て登録処理が完了しログイン画面に入る
      click_on '登録する'
      expect(current_path).to eq confirm_parttimes_path
      click_on '登録する'
      expect(current_path).to eq done_parttimes_path
      expect(page).to have_content('応募が完了しました')
      visit root_path
    end
  end

  context 'データ登録ができないとき' do
    it 'ユーザー登録を経由してデータを登録するも必要事項が記入できていないと登録できない' do
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
      # 登録するボタンを押すと確認画面を経て登録処理が完了しログイン画面に入る
      click_on '登録する'
      find('input[name="submit"]').click
      expect(current_path).to eq done_informations_path
      visit new_parttime_path
      # 面接に使う情報を入力する
      fill_in 'registration_sun_parttime_in', with: @parttime.sun_parttime_in
      fill_in 'registration_sun_parttime_out', with: @parttime.sun_parttime_out
      fill_in 'registration_mon_parttime_in', with: @parttime.mon_parttime_in
      fill_in 'registration_mon_parttime_out', with: @parttime.mon_parttime_out
      fill_in 'registration_tue_parttime_in', with: @parttime.tue_parttime_in
      fill_in 'registration_tue_parttime_out', with: @parttime.tue_parttime_out
      fill_in 'registration_wed_parttime_in', with: @parttime.wed_parttime_in
      fill_in 'registration_wed_parttime_out', with: @parttime.wed_parttime_out
      fill_in 'registration_thu_parttime_in', with: @parttime.thu_parttime_in
      fill_in 'registration_thu_parttime_out', with: @parttime.thu_parttime_out
      fill_in 'registration_fri_parttime_in', with: @parttime.fri_parttime_in
      fill_in 'registration_fri_parttime_out', with: @parttime.fri_parttime_out
      fill_in 'registration_sat_parttime_in', with: @parttime.sat_parttime_in
      fill_in 'registration_sat_parttime_out', with: @parttime.sat_parttime_out
      fill_in 'registration_pr_1', with: ''
      fill_in 'registration_pr_2', with: ''
      fill_in 'registration_pr_3', with: ''
      # 登録するボタンを押すと確認画面を経て登録処理が完了しログイン画面に入る
      click_on '登録する'
      expect(current_path).to eq confirm_parttimes_path
    end
  end
  # context 'データ登録ができないと
end
