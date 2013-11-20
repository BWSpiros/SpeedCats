class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :owner_id, :sex

  belongs_to(:owner,
  class_name: "User",
  foreign_key: :owner_id,
  primary_key: :id
  )

  has_many(:requests,
  class_name: "CatRentalRequest",
  foreign_key: :cat_id,
  primary_key: :id
  )

end
