class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname,:lastname,:firstname_kana,:lastname_kana,:sex,:birthdate_year,:birthdate_month,:birthdate_day,:phone_number,:image,:postal_code,:prefecture,:city,:building,:highschool,:h_admission,:h_graduate,:univercity,:u_admission,:u_graduate,:job_experience,:qualfication_1,:qualfication_2,:qualfication_3,:q_year_1,:q_year_2,:q_year_3,:station,:spouse])
  end
end
