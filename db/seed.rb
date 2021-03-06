require 'faker'


class SeedDB
  def self.populate


# only for creating original notes
    5.times do
      n = Note.create!

      Babble.create!   note_id:   n.id,
                       body:      Faker::Company.catch_phrase + 
                                  Faker::Company.bs + ' -' +
                                  Faker::Name.name,
                       original_note: true
    end

    15.times do
      Babble.create!   note_id:   Note.all.sample.id,
                       body:      Faker::Company.catch_phrase + 
                                  Faker::Company.bs + ' -' +
                                  Faker::Name.name,
                       original_note: false
    end

    50.times do
      Reed.create!     note_id:    Note.all.sample.id,
                       ip_address: Faker::Internet.ip_v4_address
    end      

  end
end