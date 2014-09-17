class EventsController < ApplicationController
  before_action :authenticate

  def show
    @event = Event.find(params[:id])
  end

  def new
    p current_user.created_events
    @event = current_user.created_events.build
  end

  def create
    p current_user.created_events
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      render :new
    end
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @evnet.update(event_params)
      redirect_to @event, notic: '更新しました'
    else
      render :edit
    end
  end
  private

  def event_params
    params.require(:event).permit(
      :name, :place, :content, :start_time, :end_time
    )
  end
end
