class User < ActiveRecord::Base
  attr_accessible :email, :name, :session_token, :password
  validates :email, :name, :password_digest, presence: true
  # validates :password, length: {minimum: 6, on: :create}

  def self.find_by_credentials(email, password)
    potential = User.find_by_email(email)
    potential if potential.is_password?(password)
  end


  def reset_token
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!

    self.session_token
  end


  def password=(password)
    self[:password_digest] = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  has_many(:cats,
  class_name: "Cat",
  foreign_key: :owner_id,
  primary_key: :id
  )

  has_many(:requests,
  class_name: "CatRentalRequest",
  foreign_key: :requester_id,
  primary_key: :id
  )


end
