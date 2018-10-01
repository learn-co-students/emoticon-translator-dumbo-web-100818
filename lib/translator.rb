# require modules here
require "yaml"

def load_library(file)
  emoticons_lib = YAML.load_file(file)
  library = {
    "get_meaning" => {},
     "get_emoticon" => {}
   }

  emoticons_lib.each do |meaning, emoticon|
    library["get_meaning"][emoticon[1]] = meaning
    library["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  library
end

def get_japanese_emoticon(file, e_emoticon)
  new_hash = load_library(file)
  message = "Sorry, that emoticon was not found"
  new_hash["get_emoticon"].each do |english, japanese|
    if e_emoticon == english
      message = japanese
    end
  end
  message
end

def get_english_meaning(file, j_emoticon)
  new_hash = load_library(file)
  message = "Sorry, that emoticon was not found"
  new_hash["get_meaning"].each do |japanese, english|
    if j_emoticon == japanese
      message = english
    end
  end
  message
end
