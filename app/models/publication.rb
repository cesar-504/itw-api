class Publication < ApplicationRecord
  belongs_to :user
  belongs_to :objective
  
end
