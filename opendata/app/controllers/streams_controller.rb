class StreamsController < ApplicationController
  before_action :set_stream, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :valid_user, only: [:edit, :update, :destroy]

  has_scope :by_country, as: :country
  has_scope :by_date, type: :hash, using: [:from_date, :to_date], as: :date
  has_scope :page, default: 1
  
  # GET /streams or /streams.json
  def index
    @streams = apply_scopes(Stream.all)
  end

  # GET /streams/1 or /streams/1.json
  def show
  end

  # GET /streams/new
  def new
    #@stream = Stream.new
    @stream = current_user.streams.build
  end

  # GET /streams/1/edit
  def edit
  end

  # POST /streams or /streams.json
  def create
    #@stream = Stream.new(stream_params)
    @stream = current_user.streams.build(stream_params)

    respond_to do |format|
      if @stream.valid?
        @stream.save
        format.html { redirect_to @stream, notice: 'Stream was successfully created.' }
        format.json { render :show, status: :created, location: @stream }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streams/1 or /streams/1.json
  def update
    respond_to do |format|
      if @stream.update(stream_params)
        format.html { redirect_to @stream, notice: "Stream was successfully updated." }
        format.json { render :show, status: :ok, location: @stream }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streams/1 or /streams/1.json
  def destroy
    @stream.destroy
    respond_to do |format|
      format.html { redirect_to streams_url, notice: "Stream was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def valid_user
    @stream = current_user.streams.find_by(id: params[:id])
    redirect_to streams_path, notice: "Not allowed to edit" if @stream.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stream
    @stream = Stream.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stream_params
    params.require(:stream).permit(:date, :country, :twoweek_cumulative, :departure, :self_isolation, :user_id)
  end
end
