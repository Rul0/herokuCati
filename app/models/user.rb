class User < ApplicationRecord
  has_and_belongs_to_many :projects

  #validates :name, presence: true
  #validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
