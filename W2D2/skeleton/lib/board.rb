class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      unless idx == 6 || idx == 13
        4.times { cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    # valid_starts = [0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12]
    valid_starts = (0..5).to_a + (7..12).to_a
    raise "Invalid starting cup" unless valid_starts.include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      in_hand = @cups[start_pos].dup
      @cups[start_pos] = []

      cup_idx = start_pos
      until in_hand.empty?
        cup_idx += 1
        cup_idx = 0 if cup_idx > 13
        if cup_idx == 6
          @cups[6] << in_hand.pop if current_player_name == @name1
        elsif cup_idx == 13
          @cups[13] << in_hand.pop if current_player_name == @name2
        else
          @cups[cup_idx] << in_hand.pop
        end
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
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
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all?  {|cup| cup.empty?}
  end

  def winner
    player1_points = @cups[6].length
    player2_points = @cups[13].length

    if player1_points == player2_points
      :draw
    else
      player1_points > player2_points ? @name1 : @name2
    end
  end
end
