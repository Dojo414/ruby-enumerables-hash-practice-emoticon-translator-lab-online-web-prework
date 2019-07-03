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
  translator.each do |upper_level, inner_emote|
    upper_level.each do |inner_key, inner_value|
      if upper_level === "get_emoticon"
        if inner_key.has_key?(emoticon)
          answer = inner_key[inner_value]
          binding.pry
        end
      end
    end
  end
end

def get_english_meaning
  # code goes here
end