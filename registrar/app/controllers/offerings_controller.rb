class OfferingsController < ApplicationController
  def search
    
  end

  def display
    where_condition = ""
    placeholders = {}
    if params.haskey?(:department_name)
      where_condition << "department_name = ?"
      placeholders[:department_name] = params[:department_name]
    end
    if params.haskey(:instructor_name)
      if where_condition.size > 0
        where_condition << " AND "
      end
      where_condition << "instructor_name = ?"
      placeholders[:instructor_name] = params[:instructor_name]
    end
    if params.haskey(:course_number)
      if where_condition.size > 0
        where_condition << " AND "
      end
      where_condition << "course_number = ?"
      placeholders[:course_number] = params[:course_number]
    end
    if params.haskey(:semester)
      if where_condition.size > 0
        where_condition << " AND "
      end
      where_condition << "semester = ?"
      placeholders[:semester] = params[:semester]
    end
    @offerings = Offering.join(:courses).where(where_condition, placeholders)
    respond_to do |format|
      format.html
      format.xml  { render xml: @users}
      format.json { render json: @users}
    end
  end

  def enroll
    (Offering.find_by crn: params[:crn]).decrement!(crn)
  end
end
