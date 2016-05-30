class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :semester
      t.string :location
      t.integer :section
      t.string :professor_last_name
      t.integer :spots_available
      t.integer :crn
      t.references 'course'

      t.timestamps null: false
    end
  end
end
