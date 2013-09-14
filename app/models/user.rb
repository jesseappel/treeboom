class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :statuses
attr_accessible :first_name, :last_name,:profile_name,:email, :password, :password_confirmation, :remember_me
				
attr_accessible :user_attributes

validates :first_name, presence: true
validates :last_name, presence: true
validates :profile_name, presence: true,
						uniqueness: true
						#format:{
						#	with: /a-zA-Z0-9_-/, 
						#	message: 'Must be formatted correctly.'
						#}
end 
     def full_name
     	first_name + " " +last_name
     end


