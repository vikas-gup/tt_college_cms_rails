class TimeTablesController < ApplicationController
  api :GET, '/time_rables'
  param :batch_id, :number, :desc => "ID of batch"
  param :course_id, :number, :desc => "ID of course"
  param :professor_id, :number, :desc => "ID of professor"
  param :day_of_week, :number, :desc => "Day of week"

	def index
		time_tables = TimeTable.where(time_table_params)
		render :json => time_tables, :status => :ok
	end

	private
	def time_table_params
		params.permit(:batch_id, :course_id, :professor_id, :day_of_week)
	end
end
