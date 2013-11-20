class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :session_token, :password
  validates :email, :name, :password_digest, presence: true
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

end
