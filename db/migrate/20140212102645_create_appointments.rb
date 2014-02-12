class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :doctor_id, index: true
      t.date :date_of_visit ,null: false
      t.string :pet
      t.string :customer
      t.boolean :reminder_of_appointment ,default: false
      t.text :reason_for_visit
      t.integer :receptionist_id , index: true
      t.timestamps
    end
  end
end
