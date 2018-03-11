class RequirementsController < ApplicationController
  api :GET, '/requirements'
  def index
		requirements = Requirement.all
		render :json => requirements, :status => :ok
	end

  api :GET, '/requirements/:id'
  param :id, :number, :required => true
  def show
    begin
      @requirement = Requirement.find(params[:id])
  		render :json => @requirement, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
	end

  api :POST, '/requirements'
  param :batch_id, :number, :desc => "ID of batch", :required => true
  param :course_id, :number, :desc => "ID of batch", :required => true
  param :no_of_class, :number, :desc => "No. of classes required", :required => true
  def create
    @requirement = Requirment.new(requirement_params)
    if @requirement.save
      render :json => @requirement, :status => :ok
    else
      render json: @requirement.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/requirements/:id'
  param :id, :number, :required => true
  param :batch_id, :number, :desc => "ID of batch", :required => true
  param :course_id, :number, :desc => "ID of batch", :required => true
  param :no_of_class, :number, :desc => "No. of classes required", :required => true
	def update
		@requirement = Requirement.find(params[:id])
		if @requirement.update(requirement_params)
			render :json => @requirement, :status => :ok
		else
			render json: @requirement.errors, status: :unprocessable_entity
		end
	end

  api :DELETE, '/requirements/:id'
  param :id, :number, :required => true
  def destroy
    begin
      requirement = Requirment.find(params[:id])
      requirement.destroy
      render :json => {}, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
  end

	private
	def requirement_params
		params.permit(:batch_id, :course_id, :no_of_class)
	end
end
