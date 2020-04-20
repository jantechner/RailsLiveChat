class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  # GET /chatrooms
  # GET /chatrooms.json
  def index
    @chatrooms = Chatroom.all.sort_by(&:topic)
  end

  # GET /chatrooms/1
  # GET /chatrooms/1.json
  def show; end

  # GET /chatrooms/new
  def new
    @chatroom = Chatroom.new
  end

  # GET /chatrooms/1/edit
  def edit; end

  # POST /chatrooms
  # POST /chatrooms.json
  def create
    @chatroom = Chatroom.create(chatroom_params)
    # if @chatroom.save
    #   # redirect_to @chatroom, notice: 'Chatroom was successfully created.'
    # else
    #   render :new
    # end

  end

  # PATCH/PUT /chatrooms/1
  # PATCH/PUT /chatrooms/1.json
  def update
    if @chatroom.update(chatroom_params)
      redirect_to chatrooms_path, notice: 'Chatroom was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.json
  def destroy
    @chatroom.destroy
    redirect_to chatrooms_url, notice: 'Chatroom was successfully destroyed.'

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  # Only allow a list of trusted parameters through.
  def chatroom_params
    params.require(:chatroom).permit(:topic, :description)
  end
end
