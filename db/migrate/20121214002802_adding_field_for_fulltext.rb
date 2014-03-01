class AddingFieldForFulltext < ActiveRecord::Migration
  def up
	add_column :athletes, :stats, :text
  end

  def down
  end
end
