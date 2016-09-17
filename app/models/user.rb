class User < ActiveRecord::Base
  has_many :potlucks
  has_many :attendances
  has_many :attending_potlucks, through: :attendances, source: :potluck

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  validate :check_password_length

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(inputed_password)
    @inputed_password = inputed_password
    @password = BCrypt::Password.create(inputed_password)
    self.hashed_password = @password
  end

  def authenticate(input_pass)
    self.password == input_pass
  end

  def check_password_length
    if @inputed_password.length < 6
      errors.add(:password, "must be greater than 6 characters")
    end
  end
end
