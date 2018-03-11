class CoursesController < ApplicationController
  api :GET, '/courses'
  def index
		courses = Course.all
		render :json => courses, :status => :ok
	end

  api :GET, '/courses/:id'
  param :id, :number, :required => true
	def show
    begin
  		@course = Course.find(params[:id])
  		render :json => @course, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
	end

  api :POST, '/courses'
  param :code, String, :desc => "Code of course", :required => true
  def create
    @course = Course.new(course_params)
    if @course.save
      render :json => @course, :status => :ok
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/courses/:id'
  param :id, :number, :required => true
  param :code, String, :desc => "Code of course", :required => true
	def update
		@course = Course.find(params[:id])
		if @course.update(course_params)
			render :json => @course, :status => :ok
		else
			render json: @course.errors, status: :unprocessable_entity
		end
	end

	private
	def course_params
		params.permit(:code)
	end
end
