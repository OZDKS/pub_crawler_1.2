class Local < ActiveRecord::Base
  belongs_to :owner
  has_many :employees
end
