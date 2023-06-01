class AddCoordinatesToBoxers < ActiveRecord::Migration[7.0]
  def change
    add_column :boxers, :latitude, :float
    add_column :boxers, :longitude, :float
  end
end
