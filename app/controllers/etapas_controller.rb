<%= form_for(@product) do |f| %>
    <%= f.error_messages %>
    <p>
      <%= f.label :description %><br />
      <%= f.text_field :description %>
    </p>
    <p>
      <%= f.label :value %><br />
      <%= f.text_field :value %>
    </p>
    <p>
      <%= f.submit "Create" %>
    </p>
  <% end %>class EtapasController < ApplicationController
  before_action :set_task
  def create
    @etapa = @task.etapas.create(etapa_params)
  end

  def destroy
    @etapa = @task.etapas.find(params[:id])
    if @etapa.destroy
      flash[:notice] = "Task etapa was deleted."
    else
      flash[:error] = "Task etapa could not be deleted"
    end  
    redirect_to @task
  end
  
  private
  def set_task
    @task = Task.find(params[:id])
  end

  def etapa_params
    params[:etapa].permit(:title)
  end
 
end