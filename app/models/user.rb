class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %w[admin moderator user].freeze
  attr_accessor :name

  def initialise()
    self.role ||= 'user'
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         protected
   def confirmation_required?
     false
   end
end
