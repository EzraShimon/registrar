class OfferingsController < ApplicationController
  def search
    
  end

  def display
    where_condition = ""
    placeholders = {}
    if params.has_key?(:department_name)
      where_condition << "department_name = ?"
      placeholders[:department_name] = params[:department_name]
    end
    if params.has_key?(:instructor_name)
      if where_condition.size > 0
        where_condition << " AND "
      end
      where_condition << "professor_last_name = ?"
      placeholders[:instructor_name] = params[:professor_last_name]
    end
    if params.has_key?(:course_number)
      if where_condition.size > 0
        where_condition << " AND "
      end
      where_condition << "course_number = ?"
      placeholders[:course_number] = params[:course_number]
    end
    if params.has_key?(:semester)
      if where_condition.size > 0
        where_condition << " AND "
      end
      where_condition << "semester = ?"
      placeholders[:semester] = params[:semester]
    end
    @offerings = Offering.joins(:courses).where(where_condition, placeholders)
    respond_to do |format|
      format.html { render :something }
      format.xml  { render xml: @users }
      format.json { render json: @users }
    end
  end

  def enroll
    @offering = Offering.find_by crn: params[:crn]
    @offering.decrement!(:spots_available)
  end
end
