# require modules here

require "yaml"
require "pry"

def load_library(file_path)
 new_hash = {}
 emoticons = YAML.load_file(file_path)
      new_hash["get_meaning"]={}
      new_hash["get_emoticon"]={}
  emoticons.each do |emoticon, meaning|
    new_hash["get_meaning"][meaning[1]]=emoticon
    new_hash["get_emoticon"][meaning[0]]=meaning[1]
  end
  new_hash
end

def get_japanese_emoticon(yaml_file, emoticon)
 
 all_emoticons = load_library(yaml_file)
 
 all_emoticons["get_emoticon"][emoticon] == nil ? "Sorry, that emoticon was not found" : all_emoticons["get_emoticon"][emoticon]
 
 
end

def get_english_meaning(yaml_file, emoticon)
 
 all_emoticons = load_library(yaml_file)
 
 all_emoticons["get_meaning"][emoticon] == nil ? "Sorry, that emoticon was not found" : all_emoticons["get_meaning"][emoticon]

end