class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.float :temp_in_celsius
      t.timestamps
    end
  end
end
