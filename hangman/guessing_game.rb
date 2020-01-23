require 'sinatra'
require 'sinatra/reloader' if development?

enable :sessions

# SENTENCE_DATABASE = File.read("worddb.csv").chomp.split(',')
# STARTING_SENTENCE = SENTENCE_DATABASE[rand(0..SENTENCE_DATABASE.size-1)]
STARTING_LIVES = 3
@tries = STARTING_LIVES

def game(guess, tries)
  if guess = "" || guess.nil?
    life_down(tries)
  end
end

def life_down(tries)
  tries -= 1
end

get '/' do
  @guess = params["guess"]
  game(@guess, @tries)
  erb :index
end
