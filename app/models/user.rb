class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :boxer, dependent: :destroy
  has_many :bookings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_one :boxer
  has_one_attached :photo
  validates :age, comparison: { greater_than: 17 }, numericality: { only_integer: true }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
