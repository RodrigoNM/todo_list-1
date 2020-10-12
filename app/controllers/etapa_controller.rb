class EtapaController < ApplicationController
  
  def create
    byebug
    @etapa = @task.id_nameid_name.create(etapa_params)
  end

  def destroy
    @etapa = @task.etapas.find(params[:id])
    if @etapa.destroy
      flash[:sucess] = "Task etapa was deleted."
    else
      flash[:error] = "Task etapa could not be deleted"
    end  
    redirect_to @board
  end
  
  private
  def set_task
    @task = Task.find(params[:id])
  end

  def etapa_params
    params[:etapa].permit(:title)
  end
 
end