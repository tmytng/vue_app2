class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all
  end

  def new
    @to_do = ToDo.new
  end

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      redirect_to to_dos_url
    else
      render :new
    end

  def edit
    @to_do = ToDo.find_by(id: params[:id])
  end

  def update
    @to_do = ToDo.find_by(id: params[:id])
    if @to_do.update(to_do_params)
      redirect_to to_dos_url
    else
      render :edit
    end

 end

end

private

  def to_do_params
    params.require(:to_do).permit(:title)
  end

end
