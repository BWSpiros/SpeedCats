include ApplicationHelper
class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :owner_id, :sex

  before_create :calculated_fields

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

  #
  # def age=(birth_date)
  #
  # end
  #
  # def owner_id=(owner)
  #
  # end
  #

  def calculated_fields
    # fail
    self.age = Date.today.year-self.birth_date.year

  end
end
