require 'active_record'
require_relative 'app/models/post'
require_relative 'app/models/reed'
require_relative 'app/models/babble'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'thorntreedb')


posts     = Post.all
post      = posts.first
babbles   = post.babbles
reeds     = post.reeds
holes     = post.holes

# p posts
# p post
#   p babbles.count
#   p reeds.count
#   p holes

def decay!(*args)
  b, r, h = args
  self.integrity = 1000 - (b * r * h)
end

p decay(babbles.count, reeds.count, holes)

