
# The function below converts a character to its ordinal value, then increments
# that character n amount of times wrapping back to a lower_bound whenever it
# passes the upper bound, and returns the character representation of that number
def shift_character(character, lower_bound, upper_bound, shift)
    ascii_value = character.ord

    shift.times do
        if ascii_value > upper_bound - 1
            ascii_value = lower_bound
            next
        end

        ascii_value += 1
    end

    return ascii_value.chr
end

# Function that returns a string that has done a ceaser cipher to passed in
# string.
def ceaser_cipher(string, shift)
    cipher = ""
    shift = shift % 26  # Reduce unnessary shifting

    # Loop through each character in the string, checking if it's lowercase or
    # uppercase to shift it else just add the character to cipher
    string.split("").each { |character|
        if character.ord.between?(97, 122)
            character = shift_character(character, 97, 122, shift)
        elsif character.ord.between?(65, 90)
            character = shift_character(character, 65, 90, shift)
        end

        cipher += character
    }

    cipher
end