class InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save
      redirect_to root_path, notice: 'Inquiry was successfully created.'
    else
      render action: "new"
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
    redirect_to :action => 'list'
  end

  def list
    @inquiries = Inquiry.all
  end

end
