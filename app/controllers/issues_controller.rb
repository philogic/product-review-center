class IssuesController < ApplicationController
  before_action :set_product
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = @product.issues
  end

  # GET /issues/1
  # GET /issues/1.json
  def show; end

  # GET /issues/new
  def new
    @issue = @product.issues.build
  end

  # GET /issues/1/edit
  def edit; end

  # POST /issues
  # POST /issues.json
  def create
    create_params = issue_params.merge({customer_id: current_customer.id})
    @issue = @product.issues.create(create_params)
    respond_to do |format|
      if @issue.save
        format.html { redirect_to product_issues_path, notice: "Complaint of #{@product.name} was successfully submitted." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      update_params = issue_params.merge({customer_id: current_customer.id})
      if @issue.update(update_params)
        format.html { redirect_to product_issues_path, notice: "Complaint of #{@product.name} was successfully changed" }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to product_issues_path, notice: "Issue of #{@product.name} was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_issue
    @issue = @product.issues.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.fetch(:issue, {}).permit(:severity, :comment)
  end
end
