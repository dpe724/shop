class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

has_many :orders

	def guest?
		return role == "guest"
	end

	def admin?
		return role == "admin"
	end


end
