class Member < ApplicationRecord
  #ensure that name and email is mandatory
  validates_presence_of :name, :email

  #validate email format
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                        message: "doesn't look like a proper email address"


  def age
    Date.today.year - self.dob.year
  end


end
