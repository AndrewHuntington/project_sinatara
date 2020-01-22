require 'sinatra'
require 'sinatra/reloader' if development?

SKIP_CHARACTER_REGEX = /[^\w]|_/

# just noticed this seems to fail w/values in the 700s
def caesar_cipher(message, num)
  new_string = ""
  num = num.to_i

  message.split("").map { |c|
    if c =~ SKIP_CHARACTER_REGEX
      new_string += c
    else
      num.times do
        c.next!
      end

      if c.length == 2
        new_string += c[1]
      else
        new_string += c
      end
    end
  }

  new_string
end


get '/' do
  unless params.empty?
    @message = params["message"]
    @num = params["number"]
    @cc_message = caesar_cipher(@message, @num)
  end

  erb :index
end

post '/' do
  @message = params["message"]
  @num = params["number"]
  @cc_message = caesar_cipher(@message, @num)
  erb :index
end
