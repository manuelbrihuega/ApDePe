class CategoriesController < ApplicationController  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    
    if @category.save
      flash[:notice] = "La categoria fue creada satisfactoriamente."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(params[:category])
      flash[:notice] = "La categoria fue actualizada correctamente."
      redirect_to forums_url
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    
    if @category.destroy
      flash[:notice] = "La categoria fue borrada."
      redirect_to forums_url
    end
  end
end
