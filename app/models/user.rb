class User < ActiveRecord::Base
  attr_accessible :email, :name, :session_token, :password
  validates :email, :name, :password, :password_digest, presence: true
  validates :password, length: {minimum: 6}

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


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end


end
