class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.none? { |el| el[0] == key }
      @map.push([key, value])
    else
      @map.each { |el| el[1] = value if el[0] == key }
    end
  end

  def lookup(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def remove(key)
    @map.each { |el| return @map.delete(el) if el[0] == key }
    nil
  end

  def show
    @map
  end
end

if $PROGRAM_NAME == __FILE__
  map = Map.new
  map.assign("Theo", "is cool")
  map.assign(4, "Integer")
  map.assign([0, 1], "Array")
  p map.lookup("Theo")
  p map.show
  p map.remove(4)
  p map.show
  p map.remove(5)
  p map.show
end
