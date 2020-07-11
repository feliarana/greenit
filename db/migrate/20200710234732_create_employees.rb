class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :lastname
      t.string :admission_date

      t.timestamps
    end
  end
end
