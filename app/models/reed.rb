<<<<<<< HEAD
class Reed < ActiveRecord::Base
  belongs_to :note
=======
class Reed
  def initialize
    @ip = Array.new(4) {rand(100..200)}.join('.')
    @timestamp = Time.now
  end
>>>>>>> add Babble and Reed class mockups and tested
end
