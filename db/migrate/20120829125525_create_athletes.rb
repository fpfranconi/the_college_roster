class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :city
      t.string :state
      t.string :high_school
      t.integer :graduation_year
      t.integer :height_feet
      t.integer :height_inches
      t.integer :weight
      t.decimal :gpa
      t.integer :sat
      t.integer :act
      t.string :class_rank

      t.timestamps
    end
  end
end
