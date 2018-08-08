require 'pry'
class PigLatinizer
  def piglatinize(input_str)
    x = (input_str.split(" ").length == 1) ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
    puts x
    x
  end

  private

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize_word(word)
    # word starts with vowel
    if !consonant?(word[0])
      word = word + "w"
    # word starts with 3 consonants
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    # word starts with 2 consonants
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    # word starts with 1 consonant
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word << "ay"
  end

  def piglatinize_sentence(sentence)
    sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
  end
  # attr_accessor :string
  #
  # def initialize
  #   @string = string
  # end
  #
  # def piglatinize(string)
  #   parse = string.split(" ")
  #   parsed_array = parse.map do |string|
  #     string.split /([aeiou].*)/
  #   end
  #
  #   @ans = parsed_array.map do |array|
  #     if array[0] == ""
  #       array.push("way").join
  #     elsif array.first.downcase == "i"
  #       array.reverse.push("way").join
  #     elsif array.first.downcase == "u"
  #       binding.pry
  #       array.reverse.push("way").join
  #     else
  #       array.reverse.push("ay").join
  #     end
  #   end
  #   @ans.join(" ")

  # end



end
