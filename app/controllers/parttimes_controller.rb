class ParttimesController < ApplicationController
  def new
    @parttime = Parttime.new
  end

  def confirm
    @parttime = Parttime.new
    if @parttime.valid?
      render 'confirm'
    else
      render new_parttime_path
    end
  end

  def create
    Parttime.create(parttime_params)
  end

  
  private
  def parttime_params
    params.require(:parttime).permit(:sun_parttime_in,:sun_parttime_out,:mon_parttime_in,:mon_parttime_out,:tue_parttime_in,:tue_parttime_out,:wed_parttime_in,:wed_parttime_out,:thu_parttime_in,:thu_parttime_out,:fry_parttime_in,:fry_parttime_out,:sat_parttime_in,:sat_parttime_out,:pr_1,:pr_2,:pr_3,).merge(user_id: current_user.id)
  end
end
