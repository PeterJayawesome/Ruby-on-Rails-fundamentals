class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :posts, :tite, :title 
  end
end
