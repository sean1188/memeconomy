class User < ApplicationRecord
  has_many :posts
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %w[admin moderator user].freeze
  attr_accessor :name

  def initialise()
    self.role ||= 'user'
  end

  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one_time_password(encrypted: true)
  
  def send_two_factor_authentication_code(code)
    # Send code via SMS, etc.
  end

  def need_two_factor_authentication?(request)
    self.role != 'user' # i am not sure if this works
  end
end
