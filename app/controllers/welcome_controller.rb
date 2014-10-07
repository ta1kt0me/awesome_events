class WelcomeController < ApplicationController
  PER = 3

  def index
    #@events = Event.where('start_time > ?', Time.zone.now).order(:start_time)
    @events = Event.page(params[:page]).per(PER).
      where('start_time > ?', Time.zone.now).order(:start_time)
  end
end
