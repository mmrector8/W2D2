class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample()
  end 

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

    def guess_word
      @guess_word
    end 

    def attempted_chars 
      @attempted_chars
    end 

    def remaining_incorrect_guesses
        @remaining_incorrect_guesses
    end

    def already_attempted?(char)
       @attempted_chars.include?(char)
    end

    def get_matching_indices(char)
      #array of indices
        indices = []
        #loop through secret word
        @secret_word.each_char.with_index do |chari, i|
        # if secret word includes char, push the indice
            if chari == char
            indices << i
            end
        end
      indices
    end 


    def fill_indices(char, indices)
      # loop through indices
      indices.each do |index|
        @guess_word[index] = char
      end
    end    


    def try_guess(char)
          if already_attempted?(char)
            p "that has already been attempted"
            return false
          else
            @attempted_chars << char

            matching_indices = get_matching_indices(char)
             fill_indices(char, matching_indices)

                if matching_indices.length == 0
                  @remaining_incorrect_guesses -=1
                end
            return true     
          end
    end 

    def ask_user_for_guess
        p "Enter a char: "
      input_char = gets.chomp
      guess_result = try_guess(input_char)
      guess_result
    end

    def win?
      if @guess_word.join("") == @secret_word
        p "WIN"
        return true
     else
        false
      end 
    end

    def lose?
      if remaining_incorrect_guesses == 0
        p "LOSE"
        return true
      else
        return false
      end
    end 

    def game_over?
      if self.win?
        p @secret_word
        return true
      elsif self.lose?
        p @secret_word
        return true
      else
        false
      end
    end 

end
