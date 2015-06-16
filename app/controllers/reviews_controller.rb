class ReviewsController < ApplicationController

  before_action :set_post
  before_action :check_user
  
=begin
  def index
    @reviews = Review.all
  end

  def show
  end
  
  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.post_id = @post.id
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to post_path(@post.id), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @review.update(review_params)
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @post, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_review
      @review = Review.find(params[:id])
    end
=end
  
   private 
    def set_post
      @post = Post.find(params[:post_id])
    end

    def review_params
      params.require(:review).permit(:comment)
    end
    
    def check_user 
      redirect_to post_path(@post.id)
    end
end
