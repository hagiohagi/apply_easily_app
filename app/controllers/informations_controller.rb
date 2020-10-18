class InformationsController < ApplicationController
  before_action :save_to_session, only: :step2
  before_action :save_to_session_2, only: :step3

  def index
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
    # step2で入力した値をsessionに保存
    @user = User.new(user_params) # 新規インスタンス作成
  end

  def create
    @user = User.new(
      highschool: session[:highschool],
      h_admission: session[:h_admission],
      h_graduate: session[:h_graduate],
      univercity: session[:univercity],
      u_admission: session[:u_admission],
      u_graduate: session[:u_graduate],
      job_experience: session[:job_experience],
      qualfication_1: session[:qualfication_1],
      q_year_1: session[:q_year_1],
      qualfication_2: session[:qualfication_2],
      q_year_2: session[:q_year_2],
      qualfication_3: session[:qualfication_3],
      q_year_3: session[:q_year_3],
      station: session[:station],
      spouse: session[:spouse]
    )
    if @user.save
      session[:id] = @user.id
      redirect_to done_informations_path
    else
      render '/informations/step4'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end



  def save_to_session

    session[:image] = user_params[:image]
    session[:firstname] = user_params[:firstname]
    session[:lastname] = user_params[:lastname]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:lastname_kana] = user_params[:lastname_kana]
    session[:email] = user_params[:email]
    session[:sex] = user_params[:sex]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    # session["birth_day(1i)"] = params[:user]["birth_day(1i)"]
    # session["birth_day(2i)"] = params[:user]["birth_day(2i)"]
    # session["birth_day(3i)"] = params[:user]["birth_day(3i)"]
    session[:birth_day] = Date.new(params[:user]["birth_day(1i)"]&.to_i, params[:user]["birth_day(2i)"]&.to_i, params[:user]["birth_day(3i)"]&.to_i)
    session[:phone_number] = user_params[:phone_number]
    # バリデーションをかけるため、仮でインスタンスに入力値を入れる
    
    @user = User.new(
      image: session[:image],
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
      image: "image",
      postal_code: "123-4567",
      prefecture: "tokyo",
      city: "shinjyku",
      building: "",
      highschool: "tokyo" ,
      h_admission: "2000",
      h_graduate: "",
      univercity: "",
      u_admission: "",
      u_graduate: "",
      job_experience: "xxx",
      qualification_1: "aaa",
      qualification_2: "bbb",
      qualification_3: "ccc",
      q_year_1: "1",
      q_year_2: "2",
      q_year_3: "3",
      station: "shinjyku",
      spouse: "yes"
    )
    # インスタンスにバリデーションをかけ、通らなければ1step目のページを再度表示する
    binding.pry
    render '/informations/step1' unless @user.valid?(:save_to_session)
  end

  def save_to_session_2
    session[:postal_code] = user_params[:postal_code]
    session[:prefecture] = user_params[:prefecture]
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
      image: session[:image],
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      city: session[:city],
      building: session[:building]
    )
    render '/informations/step2' unless @user.valid?(save_to_session_2)
  end


  private
  
  # 許可するキーを設定します
  def user_params

    params.require(:user).permit(
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
      :image,
      :postal_code,
      :prefecture,
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
