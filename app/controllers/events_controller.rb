class EventsController < ApplicationController
  active_scaffold :"event" do |conf|
  end
  # def index
  # 	 @events = Event.all
  # end
  # def new
  # 	@event = Event.new
  # end
  # def create
  #   @event = Event.new(event_params)

  #   respond_to do |format|
  #     if @event.save
  #       format.html { redirect_to @event, notice: 'Post was successfully created.' }
  #       format.json { render :show, status: :created, location: @event }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_event
  #     @event = Event.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def event_params
  #     params.require(:event).permit(:name)
  #   end
end
