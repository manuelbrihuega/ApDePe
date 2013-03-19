class PostsController < ApplicationController    
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    
    if params[:quote]
      quote_post = Post.find(params[:quote])
      if quote_post
        @post.body = quote_post.body
      end
    end
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(params[:post])
    @post.forum = @topic.forum
    @post.user = current_user
    
    if @post.save
      flash[:notice] = "El mensaje fue creado satisfactoriamente."
      redirect_to topic_path(@post.topic)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      flash[:notice] = "El mensaje fue actualizado satisfactoriamente."
      redirect_to topic_path(@post.topic)
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.topic.posts_count > 1
      if @post.destroy
        flash[:notice] = "El mensaje fue borrado satisfactoriamente."
        redirect_to topic_path(@post.topic)
      end
    else
      if @post.topic.destroy
        flash[:notice] = "El tema fue borrado satisfactoriamente."
        redirect_to forum_path(@post.forum)
      end
    end
  end
end
