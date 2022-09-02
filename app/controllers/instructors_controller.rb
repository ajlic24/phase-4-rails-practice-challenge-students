class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        render json: Instructor.all, status: :ok
    end
    
    def show
        instructor = find_instructor
        render json: instructor, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor = find_instructor
        instructor.update!(instructor_params)
        render json: instructor, status: :ok
    end

    def destroy
        instructor = find_instructor
        render json: instructor.destroy, status: :gone
    end

    private

    def find_instructor
        Instructor.find(params[:id])
    end

    def instructor_params
        params.permit(:name)
    end

    def not_found
        render json: {error: "Instructor not found"}, status: :not_found
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
