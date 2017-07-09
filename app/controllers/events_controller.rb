class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event  = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private
      def tasks_params
          params.require(:event).permit(:name, :description, :date, :private)
      end
  end
