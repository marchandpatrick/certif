# This file is app/controllers/movies_controller.rb
class CertificatesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @certificates = Certificate.order(sort_column + ' ' + sort_direction)
  end
  def new
    @certificate = Certificate.new
  end
  def edit
    @certificate = Certificate.find(params[:id])
  end
  def create
    @certificate = Certificate.new(params[:certificate])
    if @certificate.save
      redirect_to @certificate
    else
      render :action => 'new'
    end
  end
  def update
    @certificate = Certificate.find(params[:id])
    if @certificate.update_attributes(params[:certificate])
      redirect_to (certificates_url)
    else
      render :action => 'edit'
    end
  end
  def show
    @certificate = Certificate.find(params[:id])
    #redirect_to (certificates_url)
    binding.pry
  end
def destroy
    @certificate = Certificate.find(params[:id])
    @certificate.destroy
    redirect_to(certificates_url)
  end
  
  private
  def sort_column
    Certificate.column_names.include?(params[:sort]) ? params[:sort] : "DocumentID"   
  end
  
  def sort_direction
   %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end