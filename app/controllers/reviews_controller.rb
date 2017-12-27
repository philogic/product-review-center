class ReviewsController < ApplicationController
  before_action :set_product
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET products/:product_id/reviews
  # GET products/:product_id/reviews,json

  def index
    @reviews = @product.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show; end

  # GET /reviews/new
  def new
    @review = @product.reviews.build
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews
  # POST /reviews.json
  def create
    create_params = review_params.merge({customer_id: current_customer.id})
    @review = @product.reviews.create(create_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to product_reviews_path, notice: "Review of #{@product.name} created!" }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      update_params = review_params.merge({customer_id: current_customer.id})
      if @review.update_attributes(update_params)
        format.html { redirect_to product_reviews_path, notice: "Review of #{@product.name} successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to product_reviews_path, notice: "Review of #{@product.name} deleted :(." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:product_id])
    end

  def set_review
    @review = @product.reviews.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.fetch(:review, {}).permit(:rating, :comment)
    end
end
