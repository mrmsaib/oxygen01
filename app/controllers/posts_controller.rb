#encoding: UTF-8
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :business, :politics, :tech, :science, :health, :show]
  before_action :check_user, except: [:index, :business, :politics, :tech, :science, :health, :show]

  # GET /posts
  # GET /posts.json
  def index
    @category_id = Category.find_by(id:1)
    @posts = Post.where(category: @category_id).order("created_at DESC")
=begin   
    if params[:category].blank?
      @category_id = Category.find_by(1)
      @posts = Post.where(category: @category_id).order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category: @category_id).order("created_at DESC")
    end
=end
  end
   
  def business
    @category_id = Category.find_by(id:2)
    @posts = Post.where(category: @category_id).order("created_at DESC")
  end
  
  def politics
    @category_id = Category.find_by(id:3)
    @posts = Post.where(category: @category_id).order("created_at DESC")
  end
  
  def tech
    @category_id = Category.find_by(id:4)
    @posts = Post.where(category: @category_id).order("created_at DESC")
  end
  
  def science
    @category_id = Category.find_by(id:5)
    @posts = Post.where(category: @category_id).order("created_at DESC")
  end
  
  def health
    @category_id = Category.find_by(id:6)
    @posts = Post.where(category: @category_id).order("created_at DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @reviews = Review.where(post_id: @post.id).order("created_at DESC")
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'لقد تم تحديث البوست بنجاح' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'لقد تم حذف البوست بنجاح' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:image, :headline, :description, :source, :source_url, :category_id)
    end
    
    def check_user 
      unless current_user.admin? 
       redirect_to root_url, alert: "sorry, only admins can do that!"
      end
    end
end
