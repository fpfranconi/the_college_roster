class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :gender
      t.string :city
      t.string :state
      t.string :high_school
      t.integer :graduation_year
      t.boolean :all_american
      t.boolean :all_state
      t.boolean :all_division
      t.boolean :state_champions
      t.boolean :conference_champions

      t.timestamps
    end
  end
end
