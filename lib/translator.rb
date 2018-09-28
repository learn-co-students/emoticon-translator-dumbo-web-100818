# require modules here
require "yaml"

def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  hashy = {
    "get_emoticon" => {

    },
    "get_meaning" => {

    }
  }
  emoticons.each do |english, set|
    hashy["get_emoticon"][set.first] = set.last
    hashy["get_meaning"][set.last] = english
  end
hashy
end

def get_japanese_emoticon(path, emot)
  # code goes here
  meh = load_library(path)["get_emoticon"][emot]
if meh
  meh
else
  "Sorry, that emoticon was not found"
end

end

def get_english_meaning(path, emot)
  # code goes here
  meh = load_library(path)["get_meaning"][emot]
  if meh
    meh
  else
    "Sorry, that emoticon was not found"
  end
end
