class StepsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @step = @post.steps.create(params[:step]).valid?
    respond_to do |format|
      if @step
        flash[:notice]="Success a new step has been created."
        format.html 
        format.js { render 'create'}
      else  
        format.js {render :js=> "alert('Error saving Step, maybe you left some field on blank')"}
      end
    end
  end

  def show
  end

  def edit
    @post = Post.find(params[:post_id])
    @step = @post.steps.find(params[:id])
    respond_to do |format|
      if @step
        format.html 
        format.js { render 'edit'}
      else  
        format.js {render :js=> "alert('Error saving Step, maybe you left some field on blank')"}
      end
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @step = @post.steps.find(params[:id])
    respond_to do |format|
      if @step.update_attributes(params[:step])
        flash[:notice]="Success a new step has been created."
        format.html 
        format.js { render 'create' }
      else  
        format.js {render :js=> "alert('Error saving Step, maybe you left some field on blank')"}
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @step = @post.steps.find(params[:id])
    @step.destroy
    respond_to do |format|
        flash[:notice]="The Step has beed deleted."
        format.html 
        format.js { render 'create'}
    end
  end

end
