class Note < ActiveRecord::Base
  has_many :babbles
  has_many :reeds

  def title
    self.babbles.map(&:title).join("<br>--<br>")
  end

  def signature
    self.babbles.map(&:signature).join(".....")
  end
end

