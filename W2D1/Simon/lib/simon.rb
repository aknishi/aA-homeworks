class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
      system('clear')
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    guess = require_sequence
    @seq.each.with_index do |color, idx|
      @game_over = true if color[0] != guess[idx]
    end
    # @game_over = true unless @seq == guess
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each {|color| puts color}
    sleep 0.75
    system('clear')
    sleep 0.25
  end

  def require_sequence
    print 'Enter sequence: (ex: r, b, g, y): '
    input_seq = gets.chomp.split(',')
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    print 'Great job!'
    sleep 0.5
  end

  def game_over_message
    "That is not the right sequence. You got to #{sequence_length} rounds"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end

if  $PROGRAM_NAME == __FILE__
  game = Simon.new
  game.play
end
