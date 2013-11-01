class Post < ActiveRecord::Base
  # this lets us call Post.still_on_tree instead of Post.all
  # the -> is called a "stabby lambda" and is just code passed in as data
  scope :still_on_tree, -> { where("integrity > 0") }

  def babbles
    Array.new(rand(1..5)) { Babble.new(%w[higher faster farther].sample) }
  end

  def reeds
    Array.new(rand(1..15)) { Reed.new }
  end

  def holes
    rand(1..reeds.count)
  end

  # this works with a cron job to decay all posts on a regular clock
  # Post.all.map(&:decay!)
  def decay!(*args)
    b, r, h = args
    self.integrity = 1000 - (b * r * h)
  end
end

