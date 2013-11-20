class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :end_date, :owner_id, :requester_id, :start_date, :status

  belongs_to(:cat,
  class_name: "Cat",
  foreign_key: :cat_id,
  primary_key: :id
  )

  belongs_to(:requester,
  class_name: "User",
  foreign_key: :requester_id,
  primary_key: :id
  )



end
