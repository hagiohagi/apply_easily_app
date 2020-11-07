class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :firstname_kana, :lastname_kana, :sex, :birth_day, :phone_number, :image, :postal_code, :prefecture_id, :city, :building, :highschool, :h_admission, :h_graduate, :univercity, :u_admission, :u_graduate, :job_experience, :qualfication_1, :qualfication_2, :qualfication_3, :q_year_1, :q_year_2, :q_year_3, :station, :spouse])
  end
end
