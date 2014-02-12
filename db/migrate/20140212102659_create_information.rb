class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.references :appointment, index: true
      t.string :name_of_pet
      t.string :type_of_pet
      t.string :breed
      t.integer :age
      t.float :weight
      t.date :date_of_last_visit
      t.integer :doctor_id

      t.timestamps
    end
  end
end
