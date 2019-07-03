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
  load_library(file)
  binding.pry
end

def get_english_meaning
  # code goes here
end