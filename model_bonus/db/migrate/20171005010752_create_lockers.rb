class CreateLockers < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.integer :size
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
