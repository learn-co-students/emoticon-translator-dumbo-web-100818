require 'yaml'
require 'pry'

def load_library(file_path)
  library = {
     "get_emoticon" => {},
     "get_meaning"=> {}
  }
 list = YAML.load_file(file_path)
 list.each do |meaning,value|
   english = value[0]
   japenese = value[1]
   library["get_emoticon"][english] = japenese
   library["get_meaning"][japenese] = meaning
 end
 library
end

def get_japanese_emoticon(file_path, emoticon)
  haxh = load_library(file_path)
  haxh["get_emoticon"].each do |meaning,value|
    if meaning == emoticon
      return value
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path,emoticon)
  feel = load_library(file_path)
  feel["get_meaning"].each do |key,value|
    if key == emoticon
      return value
    end
  end
  "Sorry, that emoticon was not found"
end