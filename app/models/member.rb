class Member < ApplicationRecord
  #ensure that name and age is mandatory
  validates_presence_of :name, :dob,
          message: "you must enter name and age"
  def genderr
    if self.gender == 1
      "Male"
    else
      "Female"
    end
  end

  def age
    Date.today.year - self.dob.year
  end
end
