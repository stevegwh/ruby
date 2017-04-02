class Game
  attr_reader :victory

  def initialize
    @secret_number = rand(1...1000)
    @secret_number_arr = @secret_number.to_s.split("")
    @victory = false
  end

  private

  def is_correct?(guess)
    if guess == @secret_number
      puts "You have won!"
      @victory = true
      return
    end

    guess = guess.to_s.split("")
    count = 0
    puts "--------------"
    guess.each_with_index do |element, index|
      if @secret_number_arr.include?(element)
        if @secret_number_arr.index(element) == index
          puts "Fermi"
        else
          puts "Pico"
        end
      else
        count += 1
      end
    end

    if count == 3
      puts "Bagels"
    end
    puts "--------------"


  end

  def is_number?(number)
    begin
       Integer(number)
    rescue
       puts "Invalid number, please try again."
    else
      return true
    end
  end

  public

  def rules
    puts "--------------"
    puts "Bagels – None of the three digits you guessed is in the secret number."

    puts "Pico - One of the digits is in the secret number, but your guess has the digit in the wrong place."

    puts "Fermi – Your guess has a correct digit in the correct place."
    puts "--------------"
  end

  def turn
    puts "What is your guess? (For help, type 'rules')"

    while true
      @number = gets.chomp
      if @number == "rules"
        rules()
        puts "What is your guess? (For help, type 'rules')"
      else
        if is_number?(@number)
          length = @number.length
          @number =  @number.to_i
          if @number < 0 || @number > 999 || length != 3
            puts "Invalid number, please try again"
          else
            break
          end
        end
      end
    end

    is_correct?(@number)

  end

  def intro
    puts "BAGELS"
    rules()
  end

end


game = Game.new
game.intro
while game.victory == false
  game.turn
end
