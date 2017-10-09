class StudentsController < ApplicationController
  def new
  	@dojo = Dojo.find(params[:dojo_id])
  	@dojos = Dojo.all
  end

  def edit
  	@dojo = Dojo.find(params[:dojo_id])
  	@dojos = Dojo.all
  	@student = Student.find(params[:id])
  end

  def show
  	@dojo = Dojo.find(params[:dojo_id])
  	@student = Student.find(params[:id])
  end

  def create
  	@student = Student.create(student_params)
  	redirect_to "/dojos/#{params[:dojo_id]}"
  end

  def update
  	@student = Student.find(params[:id])
  	@student.update(student_params)
  	redirect_to "/dojos/#{params[:dojo_id]}/students/#{params[:id]}"
  end

  def destroy
  	student = Student.find(params[:id])
  	student.destroy
  	redirect_to "/dojos/#{params[:dojo_id]}"
  end

  private
  def student_params
  	params.require(:student).permit(:first_name,:last_name,:email,:dojo_id)
  end
end
