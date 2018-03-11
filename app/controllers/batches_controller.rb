class BatchesController < ApplicationController
  api :GET, '/batches'
	def index
		batches = Batch.all
		render :json => batches, :status => :ok
	end

  api :GET, '/batches/:id'
  param :id, :number, :required => true
	def show
    begin
      @batch = Batch.find(params[:id])
  		render :json => @batch, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
	end

  api :POST, '/batches'
  param :code, :number, :desc => "Code of batch", :required => true
  param :description, String, :desc => "Description for code of batch"
  def create
    @batch = Batch.new(batch_params)
    if @batch.save
      render :json => @batch, :status => :ok
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/batches/:id'
  param :id, :number, :required => true
  param :code, :number, :desc => "Code of batch", :required => true
  param :description, String, :desc => "Description for code of batch"
	def update
		@batch = Batch.find(params[:id])
		if @batch.update(batch_params)
			render :json => @batch, :status => :ok
		else
			render json: @batch.errors, status: :unprocessable_entity
		end
	end


  api :DELETE, '/batches/:id'
  param :id, :number, :required => true
  def destroy
    begin
      batch = Batch.find(params[:id])
      batch.destroy
      render :json => {}, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
  end

	private
	def batch_params
		params.permit(:code, :description)
	end
end
