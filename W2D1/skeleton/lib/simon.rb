require 'colorize'

class Simon
  COLORS = ["red", "blue", "green", "yellow"]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    puts "Welcome to Simon!"
    sleep(1)
    system("clear")

    while !@game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    if !@game_over

      show_sequence
      require_sequence
      @sequence_length += 1
      round_success_message if !@game_over
      sleep(1)
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      case color
      when "red"
        puts color.colorize(:red)
      when "green"
        puts color.colorize(:green)
      when "blue"
        puts color.colorize(:blue)
      when "yellow"
        puts color.colorize(:yellow)
      end

      sleep(0.5)
      system("clear")
      sleep(0.3)
    end
  end

  def require_sequence
    puts "Enter the sequence:"
    @sequence_length.times do |i|
      print "Color ##{i}: "
      guess = gets.strip
      if guess != @seq[i]
        @game_over = true
        break
      end
    end
    system("clear")


  end

  def add_random_color
    @seq << COLORS.sample.to_s
  end

  def round_success_message
    puts "Correct!"
    system("clear")
  end

  def game_over_message
    puts "You lose."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $0
  simon = Simon.new
  simon.play
end
