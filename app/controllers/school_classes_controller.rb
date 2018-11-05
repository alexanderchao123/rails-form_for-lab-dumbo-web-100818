class SchoolClassesController < ApplicationController
  def new
    @school_class = SchoolClass.new()
  end

  def show
    @school_class = SchoolClass.find_by(id: params[:id])
  end

  def create
    @school_class = SchoolClass.new(school_class_params)
    if @school_class.save
      redirect_to school_class_path(@school_class)
    else
      # puts error message
    end
  end

  def edit
    @school_class = SchoolClass.find_by(id: params[:id])
  end

  def update
    @school_class = SchoolClass.find_by(id: params[:id])
    if @school_class.update(school_class_params)
      redirect_to school_class_path(@school_class)
    else
      # display error
    end
  end


  private

  def school_class_params
    params.require(:school_class).permit(:title, :room_number)
  end
end
