class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @appointments = current_user.role.eql?('doctor') ?  current_user.appointments : Appointment.order('created_at DESC')
  end

  def new
   @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path,notice: 'Appointment Registered Successfully.'
    else
      render action: 'new'
    end
  end

  def edit; end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path ,notice: 'Appointment Deleted .'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :date_of_visit,:pet,:customer,:reminder_of_appointment,:reason_for_visit,:receptionist_id)
  end

end
