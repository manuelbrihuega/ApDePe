class ForumsController < ApplicationController
  before_filter :require_user
  
  def show
    @forum = Forum.find(params[:id])
  end
  
  def new
  
    @forum = Forum.new #original

  end
  
  def create
   @forum = Forum.new(params[:forum])
    
    if @forum.save
      flash[:notice] = "El foro fue creado satisfactoriamente."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def update
    @forum = Forum.find(params[:id])
    
    if @forum.update_attributes(params[:forum])
      flash[:notice] = "El foro fue actualizado satisfactoriamente."
      redirect_to forum_url(@forum)
    end
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    
    if @forum.destroy
      flash[:notice] = "La categoria fue borrada."
      redirect_to forums_url
    end
  end
end
