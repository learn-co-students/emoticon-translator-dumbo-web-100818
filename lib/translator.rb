require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  results = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons.each do |meaning, array|
    english_emoticon = array[0]
    japanese_emoticon = array[1]
    results["get_meaning"][japanese_emoticon] = meaning
    results["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  return results
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end

p load_library("lib/emoticons.yml")
