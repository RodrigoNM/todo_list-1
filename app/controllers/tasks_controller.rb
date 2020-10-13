class TasksController < ApplicationController
  before_action :set_board
  before_action :set_task, except: [:create]

  def create 
    @task = @board.tasks.create(task_params)
    redirect_to @board, notice: "Task was successfully created.."
  end
  
  def show
  end

  def destroy 
    if @task.destroy
      flash[:alert]= "Board item was deleted."
    else
      flash[:error] = "Board could not be deleted."
    end
    redirect_to @board
  end

  def complete
     @task.update_attribute(:completed_at, Time.now)
     redirect_to @board, notice: "Task completed"
  end

  
  private

  def set_board
    @board = Board.find(params[:board_id]) 
  end

  def set_task 
    @task = @board.tasks.find(params[:id])
  end
  def task_params
    params[:task].permit(:title)
  end

end