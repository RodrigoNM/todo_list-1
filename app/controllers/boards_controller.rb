class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    # respond_to do |format|
      if @board.save
        redirect_to root_url, notice: "Board was successfully created."
      else
        render :new
      end
    # end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    # respond_to do |format|
      if @board.update(board_params)
        redirect_to root_url, notice: "Board was successfully updated."
      else
        render :edit
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
      redirect_to root_url, alert: "Board was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:title)
    end
end
