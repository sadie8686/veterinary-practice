class Information < ActiveRecord::Base

  #Attributes & Variables ---------------

  #Relations ----------------------------
  belongs_to :appointment
  belongs_to :created_by, class_name: 'User',foreign_key: 'doctor_id'


 #Scopes -------------------------------

#Validations goes here ----------------
  validates :name_of_pet,:breed, presence: true, length: { maximum: 35 }
  validates :type_of_pet , inclusion: { in: %w(dog cat bird),
                                        message: "%{value} is not a valid pet type" }
  validates :age,:weight, numericality: true ,presence: true
  validates :date_of_last_visit,presence: true



#Callbacks goes here ------------------

#- Class Methods
  class << self

  end

# Instance and other methods


end
