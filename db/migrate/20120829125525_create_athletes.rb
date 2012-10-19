class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
<<<<<<< HEAD
      t.string :gender
=======
      t.boolean :gender
>>>>>>> 5b8afc67183b26786e60a3c658bc64b97ea23e02
      t.string :city
      t.string :state
      t.string :high_school
      t.integer :graduation_year
<<<<<<< HEAD
      t.integer :height_feet
      t.integer :height_inches
      t.integer :weight
      t.decimal :gpa
      t.integer :sat
      t.integer :act
      t.string :class_rank
=======
      t.boolean :all_american
      t.boolean :all_state
      t.boolean :all_division
      t.boolean :state_champions
      t.boolean :conference_champions
>>>>>>> 5b8afc67183b26786e60a3c658bc64b97ea23e02
      t.integer :user_id

      t.timestamps
    end
  end
end
