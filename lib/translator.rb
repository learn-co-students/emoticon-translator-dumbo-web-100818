require 'yaml'
require 'pry'

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

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_emoticon"].has_key?(emoticon)
    return emoticons["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_meaning"].has_key?(emoticon)
    return emoticons["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
