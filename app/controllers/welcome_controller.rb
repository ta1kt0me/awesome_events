class WelcomeController < ApplicationController
  PER = 3

  def index
    #@events = Event.where('start_time > ?', Time.zone.now).order(:start_time)
    @q = Event.page(params[:page]).per(PER).
      order(:start_time).search(search_params)

    @events = @q.result
  end

  private

  def search_params
    params.require(:q).permit(:name, :start_time_gteq)
  rescue
    { start_time_gteq: Time.zone.now}
  end
end
