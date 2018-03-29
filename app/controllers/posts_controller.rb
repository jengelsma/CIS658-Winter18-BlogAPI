class PostsController < ApplicationController
  before_action :set_author
  before_action :set_author_post, only: [:show, :update, :destroy]

  # GET /authors/:author_id/posts
  def index
    json_response(@author.posts)
  end

  # GET /authors/:author_id/posts/:id
  def show
    json_response(@post)
  end

  # POST /authors/:author_id/posts
  def create
    @author.posts.create!(post_params)
    json_response(@author, :created)
  end

  # PUT /authors/:author_id/posts/:id
  def update
    @post.update(post_params)
    head :no_content
  end

  # DELETE /authors/:author_id/posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    params.permit(:title, :article, :likes, :status)
  end

  def set_author
    @author = Author.find(params[:author_id])
  end

  def set_author_post
    @post = @author.posts.find_by!(id: params[:id]) if @author
  end
end
