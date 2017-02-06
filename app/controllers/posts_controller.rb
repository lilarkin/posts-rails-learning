class PostsController < ApplicationController
  def index
    # GET HTTP VERB
    # get all posts out of the database
    # Active Record way of doing SQL: SELECT * FROM posts;
    # Views need instance variable to access from the controller
    # .all method always returns an array
    @posts = Post.all 
  end

  def show
    # GET HTTP VERB
    # gets a single post from the database
    @post = Post.find(params[:id])
  end

  def new
    # GET HTTP VERB
    # shows the form to create a new post
    @post = Post.new
  end

  def create
    # POST HTTP VERB
    # creates a new post record in our database 
    @post = Post.new(post_params)
    if @post.save
      # if we successfylly save a post record
      # redirect_to "/posts/#{@post.id}"
      redirect_to post_show_path(@post)
    else
      # if it fails to save in the database for some reason
      render :new
    end
  end

  def edit
    # GET HTTP VERB
    # shows the same form that new does, but prefills it with the post data
    @post = Post.find(params[:id])
    # SQL = SELECT * FROM posts WHERE post.id = params[:id]
  end

  def update
    # PUT / PATCH HTTP VERB
    # updating the post record values
    @post = Post.find(params[:format])
    if @post.update(post_params)
      redirect_to post_show_path(@post)
    else
      render :edit
    end
  end

  def destroy
    # DELETE HTTP VERB
    # deletes a single post record from our database
    @post = Post.find(params[:format])
    @post.destroy
    redirect_to root_path 
  end 

  private
    def post_params
      params.require(:post).permit(:title, :author, :body)
    end
end
