class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts "You have 3 seconds to view the following code:"
    puts stringify
    sleep(3)
    system("clear")
  end

  def stringify
    str = ""
    unless @seq.length < 1
      @seq.take(@seq.length - 1).each { |color| str += "#{color}, "}
      str += @seq[-1]
    end
    str
  end

  def check_response(response)
    @game_over = true unless response == stringify
  end

  def require_sequence
      puts "Please enter sequence as it was provided."
      check_response(gets.chomp)
  end

  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "Congratulations, you have cleared the round!"
  end

  def game_over_message
    puts "I'm sorry. You have lost. Your score was #{@sequence_length - 2}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    sleep(2)
    # play
  end
end

if $PROGRAM_NAME == __FILE__
  simon = Simon.new
  simon.play
end
