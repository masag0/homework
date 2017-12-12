class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    four_stone_cup = [:stone, :stone, :stone, :stone]
    cups.each_index do |idx|
      cups[idx] += four_stone_cup unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 1 || start_pos > 13
  end

  def make_move(start_pos, current_player_name)
    current_num_stones = cups[start_pos].size
    cups[start_pos] = []
    theoretical_index = start_pos + current_num_stones
    ending_cup_idx = (theoretical_index) % 14

    if current_player_name == @name1
      # ending_cup_idx += 1 if (start_pos..theoretical_index).include?(13)
      array = (start_pos..theoretical_index).to_a
      array.each do |idx|
        next if idx == 13
        idx = idx % 14
        cups[idx] << :stone
      end
    elsif current_player_name == @name2

    end


    return :switch if cups[ending_cup_idx].empty?
    #next_turn(start_pos, ending_cup_idx)
    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    (start_pos+1..ending_cup_idx).each do |idx|

    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? { |el| el.empty? } || cups[7..-1].all? { |el| el.empty? }
  end

  def winner
    return :draw if cups[6].size == cups[13].size
    return @name1 if cups[6].size > cups[13].size
    return @name2 if cups[13].size > cups[6].size
  end
end
