class TasksController < ApplicationController
  
  def index
    new
    @tasks=Task.all
    
    respond_to do |format|
      format.html
      format.xml {render :xml=>@tasks}
    end
  end
  
  def new
    @task=Task.new
  end
  
  def create
    @task=Task.new(params[:task])
    if @task.save
      flash[:notice]='Task was successfully created'
      redirect_to :action=>"index"
    else
      @task=Task.all
      render :action=>"index"
    end
  end
  
  def finish
    @task=Task.find(params[:id])
    new={:finished=>true}
    @task.update_attributes(new)
    redirect_to :action=>"index"
    
  end
  
  def unfinish
    @task=Task.find(params[:id])
    new={:finished=>false}
    @task.update_attributes(new)
    redirect_to :action=> "index"
  end
  
  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    redirect_to(tasks_url)
  end
  
end
