class SchedulesController < ApplicationController
  require 'date'
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def autocomplete
    render json: Schedule.search(params[:query], fields: [{affected_areas: :text_start}], limit: 10).map(&:affected_areas)
  end

  # GET /schedules
  # GET /schedules.json
  def index
    t = Date::DAYNAMES[Date.today.wday]
    # Date.today.wday
    if params[:region] == "lsk" then
      my_region = "Lusaka Division"
    elsif params[:region] == "cb" then
      my_region = "Copperbelt Divison"
    elsif params[:region] == "nd" then
      my_region = "Northern Division"
    elsif params[:region] == "sd" then
      my_region = "Southern Division"
    end

    @schedules = Schedule.by_region(my_region).where("day LIKE '%#{t}%'").order(region: :asc, start_time: :asc).search "milk", page: params[:page],per_page: 20
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    @schedule = Schedule.import(params[:file])
    redirect_to schedules_url, notice: "Schedules added successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:day, :start_time, :end_time, :region, :city, :affected_areas)
    end
end
