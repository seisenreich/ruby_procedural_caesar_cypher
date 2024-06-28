def caesar_cipher(string, shift)
  shifted_char_list = string.split('').map do |char|
    if char.match(/[a-zA-Z]/)
      shift_char(char, shift)
    else
      char
    end
  end
  shifted_char_list.join('')
end

def shift_char(char, shift)
  # ASCII value of the character
  ascii = char.ord

  # base value for the ASCII values of the uppercase and lowercase letters
  base = get_base(ascii)

  new_ascii = if base
                # Shift the ASCII value of the character
                (ascii - base + shift) % 26 + base
              else
                # If the character is not a letter, return the original ASCII value
                ascii
              end

  # Convert the new ASCII value to a character
  new_ascii.chr
end

def get_base(ascii)
  case ascii
  when 65..90
    65
  when 97..122
    97
  end
end

def reverse_caesar_cipher(string, shift)
  caesar_cipher(string, -shift)
end

# Test cases
puts "caesar_cypher generates expected shifted string: #{caesar_cipher('What a string!', 5) == 'Bmfy f xywnsl!'}"
puts "reverse_caesar_cypher restores the original string: #{reverse_caesar_cipher('Bmfy f xywnsl!', 5) == 'What a string!'}"
