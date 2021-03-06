class EventsController < ApplicationController
  load_and_authorize_resource

  # GET /events
  def index
    begin
      @selected_date = Date.parse(params[:date].to_s)
    rescue ArgumentError
      @selected_date = Date.current
    end
    if @selected_date < @camp.starts
      @selected_date = @camp.starts
    end
    if @selected_date > @camp.ends
      @selected_date = @camp.ends
    end

    @events = Event.on_date(@selected_date).without_group_events.order(:starts).includes(:category)
    @categories = @events.map(&:category).uniq
  end

  # GET /events/catalog
  def catalog
    @events = @events.in_future.without_mandatory.without_group_events.without_info.includes(:category)
    @categories = @events.map(&:category).uniq
  end

  # GET /events/1
  def show
  end

  # GET /events/1/edit
  def edit
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to event_path(@event, back: params[:back])
    else
      render action: 'edit'
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def event_params
      params.
        require(:event).
        permit :starts_date, :starts_time,
               :ends_date, :ends_time,
               :lock_at_date, :lock_at_time,
               :title,
               :teaser, :description,
               :meeting_point,
               :impression,
               :youtube_url
    end
end
