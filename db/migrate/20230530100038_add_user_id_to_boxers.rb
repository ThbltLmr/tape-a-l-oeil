class AddUserIdToBoxers < ActiveRecord::Migration[7.0]
  def change
    add_reference :boxers, :user
    add_foreign_key :boxers, :users
  end
end
