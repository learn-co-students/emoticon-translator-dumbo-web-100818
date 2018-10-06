require 'yaml'# require modules here

def load_library(file_path)
	new_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  	emoticons = YAML.load_file(file_path)
  	emoticons.each do |emotion, emoticons|
  		new_hash["get_meaning"][emoticons[1]] = emotion
  		new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  	end
  	new_hash
end

def get_japanese_emoticon(file_path, emoticon)
	the_hash = load_library(file_path)
	the_hash.each do |emo_or_meaning, eom_hash|
		if emo_or_meaning == "get_emoticon"
			eom_hash.each do |eng, jap|
				if eng == emoticon
					return jap
				elsif eom_hash.keys.include?(emoticon) == false
					return "Sorry, that emoticon was not found"
				end
			end
		end
	end
end

def get_english_meaning(file_path, emoticon)
	the_hash = load_library(file_path)
	the_hash.each do |emo_or_meaning, eom_hash|
		if emo_or_meaning == "get_meaning"
			eom_hash.each do |jap, meaning|
				if jap == emoticon
					return meaning
				elsif eom_hash.keys.include?(emoticon) == false
					return "Sorry, that emoticon was not found"
				end
			end
		end
	end
end