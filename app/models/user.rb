class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :age, comparison: { greater_than: 17 }, numericality: { only_integer: true }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
