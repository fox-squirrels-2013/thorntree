
class Note < ActiveRecord::Base
  DELIMITERS = ["<br>", " , "]

  has_many :babbles
  has_many :reeds

  #######################################################
  # setup decay algorithm and related data and methods
  #######################################################

  scope :still_on_tree, -> { where("integrity > 0") }

  def decay!
    self.integrity -= (babbles.count * reeds.count * holes)
    self.save
  end

  #######################################################
  # surface babble interface into note
  #######################################################

  # def title
  #   field_helper(:title, "<br>--<br>")
  # end

  # def signature
  #   field_helper(:signature, ".....")
  # end

  def body
    field_helper(:body, "<br>~~~~~<br>")
  end

  #define_method- allows you to define a variable/dynamic method
  # [:title, :signature, :body].each_with_index do |meth, idx|
  #   define_method meth do
  #     field_helper(meth, DELIMITERS[idx])
  #   end
  # end

  def field_helper(sym, sep)
    self.babbles.map(&sym).join(sep)
  end
    
end

