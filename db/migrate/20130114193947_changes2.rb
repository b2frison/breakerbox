class Changes2 < ActiveRecord::Migration
  def up
	  add_column :breakers, :city, :string
	  remove_column :breakers, :province
  end
  

  def down
  end
end
