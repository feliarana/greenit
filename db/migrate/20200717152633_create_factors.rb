class CreateFactors < ActiveRecord::Migration[6.0]
  def change
    create_table :factors do |t|
      t.string :name
      t.string :emission_source
      t.float :emission_factor
      t.float :consumption
      t.string :unit_meassure
      t.float :emission_per_hour
      t.timestamps
    end
  end
end
