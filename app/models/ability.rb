class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    case user.role
      when 'admin'
        can :manage ,:all
      when 'doctor'
        can :manage ,Information
        can [:index] ,Appointment
      when 'receptionist'
        can :manage ,Appointment
    end
  end
end
