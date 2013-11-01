class Post < ActiveRecord::Base

  def babbles
    Array.new(rand(0..5)) { Babble.new(%w[higher faster farther].sample) }
  end

  def reeds
    Array.new(rand(0..15)) { Reed.new }
  end

  def holes
    rand(0..reeds.count)
  end
end
