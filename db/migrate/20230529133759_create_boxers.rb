class CreateBoxers < ActiveRecord::Migration[7.0]
  def change
    create_table :boxers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :weight
      t.integer :height
      t.string :address
      t.integer :price_per_day
      t.string :gender
      t.integer :availability_radius

      t.timestamps
    end
  end
end
