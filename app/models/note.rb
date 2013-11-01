class Note < ActiveRecord::Base
  has_many :babbles
  has_many :reeds
end
