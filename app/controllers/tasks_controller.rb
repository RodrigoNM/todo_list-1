class TasksController < ApplicationController
  before_action :set_board

  def create 
    @task = @board.tasks.create(task_params)
    redirect_to @board
  end

  def destroy 
    @task = @board.tasks.find(params[:id])
    if @task.destroy
      flash[:sucess] = "Board item was deleted."
    else
      flash[:error] = "Board could not be deleted."
    end
    redirect_to @board
  end



  private

  def set_board
    @board = Board.find(params[:board_id]) 
  end

  def task_params
    params[:task].permit(:title)
  end

end