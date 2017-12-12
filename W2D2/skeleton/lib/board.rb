class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = []
    6.times { @cups << [:stone, :stone, :stone, :stone] }
    @cups << []
    6.times { @cups << [:stone, :stone, :stone, :stone] }
    @cups << []
    @p1 = name1
    @p2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless ((0..5).to_a + (7..12).to_a).include?(start_pos)
      raise ArgumentError.new("Invalid starting cup")
    end
    if @cups[start_pos].empty?
      raise ArgumentError.new("Cannot start from empty cup!")
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    next_cup = start_pos
    until stones.empty?
      next_cup = next_cup + 1
      next_cup += 1 if current_player_name == @p1 && next_cup == 13
      next_cup += 1 if current_player_name == @p2 && next_cup == 6
      next_cup = 0 if next_cup > 13
      @cups[next_cup] << stones.pop
    end
    render
    next_turn(next_cup)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    return @p1 if @cups[6].length > @cups[13].length
    @p2
  end
end
