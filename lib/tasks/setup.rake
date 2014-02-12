namespace :db do
  desc "Setup form demo"
  task demo_setup: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:create_users"].invoke
    Rake::Task["db:create_appointments"].invoke
  end

  desc "Create Users"
  task create_users: :environment do
    User.destroy_all
    puts "------Creating Demo users ...."
    {'Admin'=>'admin','Bob'=>'doctor','Susan'=>'doctor','Receptionist'=>'receptionist'}.each do |name,role|
      User.create(name: name,email: "#{name.downcase}@test.com",role: role,address: "#{Faker::Address.building_number} #{Faker::Address.street_address}",
                  city: Faker::Address.city,state: Faker::Address.state ,zip: Faker::Address.zip_code,years_in_practice: (5..10).to_a.sample, password: "#{role}123", password_confirmation: "#{role}123")
    end
  end

  desc "Create Appointments"
  task create_appointments: :environment do
    receptionist = User.receptionist
    puts "------Creating Appointments ...."
    pet = %w[dog cat bird]
    reminder = [true,false]
    (1..4).each do |number|
      Appointment.create(doctor_id: User.doctors.map(&:id).sample,date_of_visit: Date.today,pet: pet.sample,customer: Faker::Name.name,
                         reminder_of_appointment: reminder.sample,reason_for_visit: Faker::Lorem.paragraph,receptionist_id: receptionist.id)
    end

  end

end