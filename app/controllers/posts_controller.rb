class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    begin
      @posts = Post.order(created_at: :desc)
    rescue ActiveRecord::StatementInvalid => e
      if e.message.include?("Could not find table")
        # Database not set up yet, run migrations
        Rails.logger.error "Database table missing, attempting to migrate..."
        system("bundle exec rails db:migrate 2>&1")
        @posts = Post.order(created_at: :desc) rescue []
      else
        raise
      end
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
end

