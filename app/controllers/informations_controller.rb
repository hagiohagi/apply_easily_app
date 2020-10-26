class InformationsController < ApplicationController
  before_action :save_to_session, only: :step2
  before_action :save_to_session_2, only: :step3
  before_action :save_to_session_3, only: :confirm

  def index
    @users = User.all
    @parttimes = Parttime.includes(:user)
  end

  def step1
    @user = User.new
    # 新規インスタンス作成
  end

  def step2
    @user = User.new
    # 新規インスタンス作成
  end

  def step3
    @user = User.new
    # 新規インスタンス作成
  end

  def confirm
    @user = User.new(
      firstname: session[:firstname],
      lastname: session[:lastname],
      firstname_kana: session[:firstname_kana],
      lastname_kana: session[:lastname_kana],
      email: session[:email],
      sex: session[:sex],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      building: session[:building],
      highschool: user_params[:highschool],
      h_admission: user_params[:h_admission],
      h_graduate: user_params[:h_graduate],
      univercity: user_params[:univercity],
      u_admission: user_params[:u_admission],
      u_graduate: user_params[:u_graduate],
      job_experience: user_params[:job_experience],
      qualification_1: user_params[:qualification_1],
      q_year_1: user_params[:q_year_1],
      qualification_2: user_params[:qualification_2],
      q_year_2: user_params[:q_year_2],
      qualification_3: user_params[:qualification_3],
      q_year_3: user_params[:q_year_3],
      station: user_params[:station],
      spouse: user_params[:spouse]
    )
    if @user.valid?
      render 'confirm'
    else
      render '/informations/step3'
    end
  end

  def create
    @user = User.new(
      firstname: session[:firstname],
      lastname: session[:lastname],
      firstname_kana: session[:firstname_kana],
      lastname_kana: session[:lastname_kana],
      email: session[:email],
      sex: session[:sex],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      building: session[:building],
      highschool: session[:highschool],
      h_admission: session[:h_admission],
      h_graduate: session[:h_graduate],
      univercity: session[:univercity],
      u_admission: session[:u_admission],
      u_graduate: session[:u_graduate],
      job_experience: session[:job_experience],
      qualification_1: session[:qualification_1],
      qualification_2: session[:qualification_2],
      qualification_3: session[:qualification_3],
      q_year_1: session[:q_year_1],
      q_year_2: session[:q_year_2],
      q_year_3: session[:q_year_3],
      station: session[:station],
      spouse: session[:spouse]
    )

    render '/informations/step1' and return if params[:back]

    binding.pry
    if @user.save
      session[:id] = @user.id
      redirect_to done_informations_path
    else
      render '/informations/step1'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def save_to_session
    session[:firstname] = user_params[:firstname]
    session[:lastname] = user_params[:lastname]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:email] = user_params[:email]
    session[:sex] = user_params[:sex]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birth_day] = Date.new(params[:user]['birth_day(1i)']&.to_i, params[:user]['birth_day(2i)']&.to_i, params[:user]['birth_day(3i)']&.to_i)
    session[:phone_number] = user_params[:phone_number]
    # バリデーションをかけるため、仮でインスタンスに入力値を入れる

    @user = User.new(
      firstname: session[:firstname],
      lastname: session[:lastname],
      firstname_kana: session[:firstname_kana],
      lastname_kana: session[:lastname_kana],
      email: session[:email],
      sex: session[:sex],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number],
      postal_code: '1234567',
      prefecture_id: '1',
      city: 'shinjyku',
      building: '',
      highschool: 'tokyo',
      h_admission: '2000',
      h_graduate: '',
      univercity: '',
      u_admission: '',
      u_graduate: '',
      job_experience: 'xxx',
      qualification_1: 'aaa',
      qualification_2: 'bbb',
      qualification_3: 'ccc',
      q_year_1: '1',
      q_year_2: '2',
      q_year_3: '3',
      station: 'shinjyku',
      spouse: 'yes'
    )
    binding.pry
    # インスタンスにバリデーションをかけ、通らなければ1step目のページを再度表示する
    render '/informations/step1' unless @user.valid?(:save_to_session)
  end

  def save_to_session_2
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture_id] = user_params[:prefecture_id]
    session[:city] = user_params[:city]
    session[:building] = user_params[:building]

    @user = User.new(
      firstname: session[:firstname],
      lastname: session[:lastname],
      firstname_kana: session[:firstname_kana],
      lastname_kana: session[:lastname_kana],
      email: session[:email],
      sex: session[:sex],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      building: session[:building],
      highschool: 'tokyo',
      h_admission: '2000',
      h_graduate: '',
      univercity: '',
      u_admission: '',
      u_graduate: '',
      job_experience: 'xxx',
      qualification_1: 'aaa',
      qualification_2: 'bbb',
      qualification_3: 'ccc',
      q_year_1: '1',
      q_year_2: '2',
      q_year_3: '3',
      station: 'shinjyku',
      spouse: 'yes'
    )
    render '/informations/step2' unless @user.valid?(:save_to_session_2)
  end

  def save_to_session_3
    session[:highschool] = user_params[:highschool]
    session[:h_admission] = user_params[:h_admission]
    session[:h_graduate] = user_params[:h_graduate]
    session[:univercity] = user_params[:univercity]
    session[:u_admission] = user_params[:u_admission]
    session[:u_graduate] = user_params[:u_graduate]
    session[:job_experience] = user_params[:job_experience]
    session[:qualification_1] = user_params[:qualification_1]
    session[:q_year_1] = user_params[:q_year_1]
    session[:qualification_2] = user_params[:qualification_2]
    session[:q_year_2] = user_params[:q_year_2]
    session[:qualification_3] = user_params[:qualification_3]
    session[:q_year_3] = user_params[:q_year_3]
    session[:station] = user_params[:station]
    session[:spouse] = user_params[:spouse]

    @user = User.new(
      firstname: session[:firstname],
      lastname: session[:lastname],
      firstname_kana: session[:firstname_kana],
      lastname_kana: session[:lastname_kana],
      email: session[:email],
      sex: session[:sex],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number],
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      building: session[:building],
      highschool: session[:highschool],
      h_admission: session[:h_admission],
      h_graduate: session[:h_graduate],
      univercity: session[:univercity],
      u_admission: session[:u_admission],
      u_graduate: session[:u_graduate],
      job_experience: session[:job_experience],
      qualification_1: session[:qualification_1],
      qualification_2: session[:qualification_2],
      qualification_3: session[:qualification_3],
      q_year_1: session[:q_year_1],
      q_year_2: session[:q_year_2],
      q_year_3: session[:q_year_3],
      station: session[:station],
      spouse: session[:spouse]
    )
    render '/informations/step3' unless @user.valid?(:save_to_session_3)
  end

  private

  # 許可するキーを設定します
  def user_params
    params.require(:user).permit(
      :image,
      :firstname,
      :lastname,
      :firstname_kana,
      :lastname_kana,
      :email,
      :sex,
      :password,
      :password_confirmation,
      :birth_day,
      :phone_number,
      :postal_code,
      :prefecture_id,
      :city,
      :building,
      :highschool,
      :h_admission,
      :h_graduate,
      :univercity,
      :u_admission,
      :u_graduate,
      :job_experience,
      :qualification_1,
      :qualification_2,
      :qualification_3,
      :q_year_1,
      :q_year_2,
      :q_year_3,
      :station,
      :spouse
    )
  end
end
