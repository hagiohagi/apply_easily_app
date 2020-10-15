class InformationsController < ApplicationController

  def index
  end

  def step1
  end

  def step2
  end

  def step3
  end
  
  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end
end
