class OCR
  attr_accessor :text
  def initialize(text)
    @text = text
  end

  def convert
    if @text == <<-STRING.chomp
 _ 
| |
|_|

    STRING
      return '0'
    elsif @text == <<-STRING.chomp

  |
  |

    STRING
      return '1'
    end
  end
end