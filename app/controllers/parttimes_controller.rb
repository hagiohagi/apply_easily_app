class ParttimesController < ApplicationController
  def index
    @parttimes = Parttime.includes(:user)
  end

  def new
    @parttime = Parttime.new
  end

  def show
    @user = User.find(params[:id])
    @parttime = @user.parttime
    # @parttime = @user.parttime
  end

  def confirm
    @parttime = Parttime.new(
      sun_parttime_in: parttime_params[:sun_parttime_in],
      sun_parttime_out: parttime_params[:sun_parttime_out],
      mon_parttime_in: parttime_params[:mon_parttime_in],
      mon_parttime_out: parttime_params[:mon_parttime_out],
      tue_parttime_in: parttime_params[:tue_parttime_in],
      tue_parttime_out: parttime_params[:tue_parttime_out],
      wed_parttime_in: parttime_params[:wed_parttime_in],
      wed_parttime_out: parttime_params[:wed_parttime_out],
      thu_parttime_in: parttime_params[:thu_parttime_in],
      thu_parttime_out: parttime_params[:thu_parttime_out],
      fri_parttime_in: parttime_params[:fri_parttime_in],
      fri_parttime_out: parttime_params[:fri_parttime_out],
      sat_parttime_in: parttime_params[:sat_parttime_in],
      sat_parttime_out: parttime_params[:sat_parttime_out],
      pr_1: parttime_params[:pr_1],
      pr_2: parttime_params[:pr_2],
      pr_3: parttime_params[:pr_3]
    )

    @parttime.user_id = current_user.id

    session[:user_id] = current_user.id
    session[:sun_parttime_in] = parttime_params[:sun_parttime_in]
    session[:sun_parttime_out] = parttime_params[:sun_parttime_out]
    session[:mon_parttime_in] = parttime_params[:mon_parttime_in]
    session[:mon_parttime_out] = parttime_params[:mon_parttime_out]
    session[:tue_parttime_in] = parttime_params[:tue_parttime_in]
    session[:tue_parttime_out] = parttime_params[:tue_parttime_out]
    session[:wed_parttime_in] = parttime_params[:wed_parttime_in]
    session[:wed_parttime_out] = parttime_params[:wed_parttime_out]
    session[:thu_parttime_in] = parttime_params[:thu_parttime_in]
    session[:thu_parttime_out] = parttime_params[:thu_parttime_out]
    session[:fri_parttime_in] = parttime_params[:fri_parttime_in]
    session[:fri_parttime_out] = parttime_params[:fri_parttime_out]
    session[:sat_parttime_in] = parttime_params[:sat_parttime_in]
    session[:sat_parttime_out] = parttime_params[:sat_parttime_out]
    session[:pr_1] = parttime_params[:pr_1]
    session[:pr_2] = parttime_params[:pr_2]
    session[:pr_3] = parttime_params[:pr_3]

    if @parttime.valid?
      render 'confirm'
    else
      render new_parttime_path
    end
  end

  def create
    @parttime = Parttime.new(
      user_id: session[:user_id],
      sun_parttime_in: session[:sun_parttime_in],
      sun_parttime_out: session[:sun_parttime_out],
      mon_parttime_in: session[:mon_parttime_in],
      mon_parttime_out: session[:mon_parttime_out],
      tue_parttime_in: session[:tue_parttime_in],
      tue_parttime_out: session[:tue_parttime_out],
      wed_parttime_in: session[:wed_parttime_in],
      wed_parttime_out: session[:wed_parttime_out],
      thu_parttime_in: session[:thu_parttime_in],
      thu_parttime_out: session[:thu_parttime_out],
      fri_parttime_in: session[:fri_parttime_in],
      fri_parttime_out: session[:fri_parttime_out],
      sat_parttime_in: session[:sat_parttime_in],
      sat_parttime_out: session[:sat_parttime_out],
      pr_1: session[:pr_1],
      pr_2: session[:pr_2],
      pr_3: session[:pr_3]
    )

    render new_parttime_path and return if params[:back]

    if @parttime.save
      redirect_to done_parttimes_path
    else
      render new_parttime_path
    end
  end

  def done
    sign_out User.find(current_user.id) if user_signed_in?
  end

  private

  def parttime_params
    params.require(:parttime).permit(:sun_parttime_in, :sun_parttime_out, :mon_parttime_in, :mon_parttime_out, :tue_parttime_in, :tue_parttime_out, :wed_parttime_in, :wed_parttime_out, :thu_parttime_in, :thu_parttime_out, :fri_parttime_in, :fri_parttime_out, :sat_parttime_in, :sat_parttime_out, :pr_1, :pr_2, :pr_3).merge(user_id: current_user.id)
  end
end
