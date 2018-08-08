require 'pry'

class PigLatinizer
  attr_accessor :text

  def initialize()
    @text = text
  end

  def piglatinize(input_str)
    x = (input_str.split(" ").length == 1) ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
    # puts x
    x
  end

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
   result = sentence.split.map do |word|
     piglatinize_word(word)
   end
   result.join(" ")
 end

end



# pig = PigLatinizer.new
# pig.piglatinize("what in the world")

# class PigLatinizer
#   attr_accessor :text
#
#   def initialize()
#     @text = text
#   end
#
#   def piglatinize(text)
#     result = text.split.map do |word|
#       @first_vowel = word.scan(/[aeoui]/).first
#       @letters_before_vowel = word.partition(@first_vowel).first
#       @letters_after_vowel = word.partition(@first_vowel).last
#       # binding.pry
#       if word[0].downcase == "i"
#         "#{@first_vowel}w#{@letters_after_vowel}#{@letters_before_vowel}ay"
#       else
#         "#{@first_vowel}#{@letters_after_vowel}#{@letters_before_vowel}ay"
#       end
#     end
#     result.join(" ")
#     # binding.pry
#   end
# end

# def piglatinize(text)
#   result = nil
#   if text.length < 1
#     text.split.map do |word|
#       @first_vowel = word.scan(/[aeoui]/).first
#       @letters_before_vowel = word.partition(@first_vowel).first
#       @letters_after_vowel = word.partition(@first_vowel).last
#       # binding.pry
#       if word[0].downcase == "i"
#         result = "#{@first_vowel}w#{@letters_after_vowel}#{@letters_before_vowel}ay"
#       else
#         result = "#{@first_vowel}#{@letters_after_vowel}#{@letters_before_vowel}ay"
#       end
#     end
#     result.join(" ")
#   else
#     if text[0].scan(/[aeoui]/) != nil
#       result = "#{text}way"
#     end
#   # binding.pry
#   end
# end
# end


# def piglatinize(text)
#   result = text.split.map do |word|
#     @first_vowel = word.scan(/[aeoui]/).first
#     @w = word[0].scan(/[aeoui]/)
#     @letters_before_vowel = word.partition(@first_vowel).first
#     @letters_after_vowel = word.partition(@first_vowel).last
#     # binding.pry
#     if @w != nil
#       "#{@first_vowel}w#{@letters_after_vowel}#{@letters_before_vowel}ay"
#     else
#       "#{@first_vowel}#{@letters_after_vowel}#{@letters_before_vowel}ay"
#     end
#   end
#   result.join(" ")
#   binding.pry
# end
