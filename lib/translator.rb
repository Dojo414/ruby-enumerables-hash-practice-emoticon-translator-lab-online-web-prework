# require modules here

require 'yaml'
require 'pry'

def load_library(file)
  emoticons = YAML.load_file(file)
  translator = { "get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |writing, emotes|
    translator.each do |outer_key, inner_hash|
      if outer_key === "get_meaning"
        inner_hash[emotes[1]] = writing
      else inner_hash[emotes[0]] = emotes[1]
      end 
    end
  end
  translator
end

def get_japanese_emoticon(file_name, emoticon)
  translator = load_library(file_name)
  if translator["get_emoticon"].has_key?(emoticon)
    answer = translator["get_emoticon"][emoticon]
    return answer
  else return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_name, japanese_emote)
  translator = load_library(file_name)
  if translator["get_meaning"].has_key?(japanese_emote)
    answer = translator["get_meaning"][japanese_emote]
    return answer
  else return "Sorry, that emoticon was not found"
  end
end