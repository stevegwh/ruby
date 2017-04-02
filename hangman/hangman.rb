class Game
  $animals = 'ant baboon badger bat bear beaver camel cat clam cobra cougar coyote crow deer dog donkey duck eagle ferret fox frog goat goose hawk lion lizard llama mole monkey moose mouse mule newt otter owl panda parrot pigeon python rabbit ram rat raven rhino salmon seal shark sheep skunk sloth snake spider stork swan tiger toad trout turkey turtle weasel whale wolf wombat zebra'.split()
  $countries = 'japan england jamaica canada france germany greece spain finland sweden norway ghana china korea australia argentina brazil uruguay'.split()
  $food = 'burger hotdog spaghetti pasta bread cheese rice lemon strawberry grape onion carrot donut'.split()
  $office = 'jim pam michael dwight angela kevin ryan oscar stanley meredith phyllis darryl roy'.split()

  $words = [{"category"=>"animals", "words"=>$animals}, {"category"=>"countries", "words"=> $countries},{"category"=>"food", "words"=>$food},  {"category"=>"Characters from the office", "words"=>$office}]

  $board = []
  $guesses = []

  def initialize()
    @word = getCat()
    @word.length.times{$board.push("_")}
    @lives = 5
  end

  private

  def getCat
      puts "What category would you like? (choose the number)"

      indexes = []
      $words.each_with_index{|item, index|
        indexes.push(index + 1)
        puts "#{index + 1}. #{item['category'].capitalize}"
      }

      while true
        user_choice = gets.chomp.to_i
        if indexes.include?(user_choice)
          user_choice -= 1
          break
        else
          puts "Sorry, that's incorrect"
        end
      end

      $words[user_choice]["words"][rand($words[user_choice]["words"].length)].split("")
  end

  def drawBoard
    $board.each do |x|
      print x + " "
    end
    puts ""
  end

  def getGuess
    puts "What is your letter? (type 'guesses' for what you have already used)"
    user_choice = gets.chomp.downcase
    if $guesses.include?(user_choice)
      puts "You have already guessed that"
    elsif user_choice == "guesses"
      $guesses.each{|x| puts "#{x.upcase}"} if $guesses.length > 0
      puts "You haven't guessed anything" if $guesses.length == 0
    else
      $guesses.push(user_choice)
      checkWord(user_choice)
    end
  end

  def checkWord(guess)
    if @word.include?(guess)
       @word.each_with_index{|item, index| $board[index] = guess if item == guess}
       drawBoard()
    else
      @lives -= 1
      puts "Incorrect, you have #{@lives} lives remaining"
      drawBoard()
    end
  end

  def gameOver
    puts "GAME OVER! The correct answer was '#{@word.join("")}'!"
  end

  def victory
    puts "Victory!"
  end

  public

  def start
    drawBoard()
    while true
      if @lives <= 0
        gameOver()
        break
      elsif !$board.include?("_")
        victory()
        break
      else
        getGuess()
      end
    end
  end


end

puts "HANGMAN"
game = Game.new()
game.start()
