require 'faker'


class SeedDB
  def self.populate

    5.times do
      Post.create! title:     Faker::Company.name,
                   body:      Faker::Company.catch_phrase,
                   signature: Faker::Name.name

    end
  end
end