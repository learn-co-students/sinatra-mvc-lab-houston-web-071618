class PigLatinizer

  def piglatinize(words)
    words.split(" ").map { |word| piglatinize_word(word) }.join(" ")
  end

  def piglatinize_word(word)
    first = first_section(word)

    if first[:vowel]
      "#{word}way"
    else
      consonant = first[:consonant]
      "#{word[(consonant.length)..-1]}#{consonant}ay"
    end
  end


  def first_section(word)
    if vowels.include?(word[0].downcase)
      return { :vowel => word[0] }
    else
      found = find_consonants(word)
      return { :consonant => found }
    end
  end

  def find_consonants(word)
    vowel_found = false
    consonant = ""

    until vowel_found
      word.split("").each do |letter|
        if vowels.include?(letter.downcase)
          vowel_found = true
          break
        else
          consonant += letter
        end
      end
    end
    consonant
  end

  def vowels
    vowels = "aeiou".split("")
  end

end
