class ProfessorsController < ApplicationController
  api :GET, '/professors'
  def index
		professors = Professor.all
		render :json => professors, :status => :ok
	end

  api :GET, '/professors/:id'
  param :id, :number, :required => true
	def show
    begin
      @professor = Professor.find(params[:id])
  		render :json => @professor, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
	end

  api :POST, '/professors'
  param :name, String, :desc => "Name of professor", :required => true
  def create
    @professor = Professor.new(professor_params)
    if @professor.save
      render :json => @professor, :status => :ok
    else
      render json: @professor.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/professors/:id'
  param :id, :number, :required => true
  param :name, String, :desc => "Name of professor", :required => true
	def update
		@professor = Professor.find(params[:id])
		if @professor.update(professor_params)
			render :json => @professor, :status => :ok
		else
			render json: @professor.errors, status: :unprocessable_entity
		end
	end

  api :DELETE, '/professors/:id'
  param :id, :number, :required => true
  def destroy
    begin
      professor = Professor.find(params[:id])
      professor.destroy
      render :json => {}, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
  end

	private
	def professor_params
		params.permit(:name)
	end
end
