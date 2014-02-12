class InformationController < ApplicationController
  before_action :authenticate_user!
  before_action :load_information, only: :create
  load_and_authorize_resource

  def new
    @appointment = Appointment.find(params[:appointment_id])
    @information = @appointment.build_information
  end

  def create
    if @information.save
      redirect_to appointments_path,notice: 'Appointment Registered Successfully.'
    else
      render action: 'new'
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def information_params
    params.require(:information).permit(:appointment_id ,:doctor_id,:name_of_pet,:type_of_pet,:breed,:age,:weight,:date_of_last_visit)
  end

  def load_information
    @information = Information.new(information_params)
  end

end
