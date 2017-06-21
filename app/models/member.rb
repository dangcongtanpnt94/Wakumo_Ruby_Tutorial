class Member < ApplicationRecord
  #ensure that name and age is mandatory
  validates_presence_of :name, :age,
          message: "you must enter name and age"
  validates_numericality_of :age, greater_than: 0, less_than_or_equal_to: 80, only_integer: true
  def genderr
    if self.gender == 1
      "Male"
    else
      "Female"
    end
  end
end
