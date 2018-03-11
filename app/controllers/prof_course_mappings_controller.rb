class ProfCourseMappingsController < ApplicationController
  api :GET, '/prof_course_mappings'
  def index
		prof_course_maps = ProfCourseMapping.all
		render :json => prof_course_maps, :status => :ok
	end

  api :GET, '/prof_course_mappings/:id'
  param :id, :number, :required => true
	def show
    begin
  		@prof_course_map = ProfCourseMapping.find(params[:id])
  		render :json => @prof_course_map, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
	end

  api :POST, '/prof_course_mappings'
  param :professor_id, :number, :desc => "Id of professor", :required => true
  param :course_id, :number, :desc => "Id of course", :required => true
  def create
    @prof_course_map = ProfCourseMapping.new(prof_course_params)
    if @prof_course_map.save
      render :json => @prof_course_map, :status => :ok
    else
      render json: @prof_course_map.errors, status: :unprocessable_entity
    end
  end

  api :PUT, '/prof_course_mappings/:id'
  param :id, :number, :required => true
  param :professor_id, :number, :desc => "Id of professor", :required => true
  param :course_id, :number, :desc => "Id of course", :required => true
	def update
		@prof_course_map = ProfCourseMapping.find(params[:id])
		if @prof_course_map.update(prof_course_params)
			render :json => @prof_course_map, :status => :ok
		else
			render json: @prof_course_map.errors, status: :unprocessable_entity
		end
	end

  api :DELETE, '/prof_course_mappings/:id'
  param :id, :number, :required => true
  def destroy
    begin
      prof_course_map = ProfCourseMapping.find(params[:id])
      prof_course_map.destroy
      render :json => {}, :status => :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.to_s }, status: :not_found
    end
  end

	private
	def prof_course_params
		params.permit(:professor_id, :course_id)
	end
end
