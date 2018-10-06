require 'pry'

def load_library(emoticons)
  require 'yaml'
  emoticons = YAML.load_file("./lib/emoticons.yml")
  emoticons
end

def get_japanese_emoticon(emoticons, emo)
 search = load_library(emoticons)["get_emoticon"]
 if search.keys.include?(emo)
    search.each do |key, value|
    if emo == key
      return value
    end
    end
 else
     "Sorry, that emoticon was not found"
 end
end

def get_english_meaning(emoticons, emo)
   search = load_library(emoticons)["get_meaning"]
 if search.keys.include?(emo)
    search.each do |key, value|
    if emo == key
      return value
    end
    end
 else
     "Sorry, that emoticon was not found"
 end
end