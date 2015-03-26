class MultispecController < ApplicationController
  def create
    puts 'params[:file] = ' + params[:file].to_s

   # @multispec = Multispec.new(file_name: params[:file])
   # if @multispec.save!
   #   respond_to do |format|
   #     format.html {}
   #     format.json{ render :json => @multispec }
   #   end
   # end
  end
end
