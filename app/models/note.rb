
class Note < ActiveRecord::Base
  DELIMITERS = [" ... ", "<hr>", " ~~~ "]
  has_many :babbles
  has_many :reeds

  # def title
  #   field_helper(:title, "<br>--<br>")
  # end

  # def signature
  #   field_helper(:signature, ".....")
  # end

  # def body
  #   field_helper(:body, "~~~~")
  # end

  #define_method- allows you to define a variable/dynamic method
  [:title, :signature, :body].each do |meth|
    define_method meth do
      field_helper(meth, DELIMITERS.sample)
    end
  end

  def field_helper(sym, sep)
    self.babbles.map(&sym).join(sep)
  end
    
end

