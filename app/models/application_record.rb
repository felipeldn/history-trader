class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def full_name
    return "#{self.first_name} #{self.last_name}" 
  end

  def user_name
    self.user.username
  end

end
