# require modules here
require 'yaml'
require 'pry'
#yml file is a hash key of emoticon titles with an array of chars as the value
def load_library(path)
    emoticon_list = YAML.load_file(path)
    emoticon_hash = Hash.new
    emoticon_hash["get_emoticon"] = Hash.new
    emoticon_hash["get_meaning"] = Hash.new
    emoticon_list.each do |emoticon_title, emoticon_set|
        emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
        #emoticon_hash => get_emoticon =>{ O:) } = ☜(⌒▽⌒)☞ and so on
                        # get_meaning = > { ☜(⌒▽⌒)☞ } = O:)
        emoticon_hash["get_meaning"][emoticon_set.last] = emoticon_title
    end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
    #plug emoticon to the japanese array if is nil print the error message
    emoticon_hash = load_library(path)
    result = emoticon_hash["get_emoticon"][emoticon]
    if result == nil
        result = "Sorry, that emoticon was not found"
    end
    result
end


def get_english_meaning(path, emoticon)
    #do the opposite with this one subbing the japanese arr for the eng arr
    emoticon_hash = load_library(path)
    result = emoticon_hash["get_meaning"][emoticon]
    if result == nil
        result = "Sorry, that emoticon was not found"
    end
    result
end
