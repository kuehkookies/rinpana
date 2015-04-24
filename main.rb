require 'method_profiler'

Dir[File.dirname(__FILE__) + '*.*'].each {|file| p file.inspect; require file }

require_relative "astar/AMap"
require_relative "map.rb"

include AStar

class Hanayo
	def initialize
		@map = Map.new("map.txt")
  end

  def wants_astar_rice
  	x = @map.find_path_astar([0,0], [7,10])
  	return x.reverse
  end

  def wants_dijkstra_rice
  	x = @map.find_path_dijkstra([0,0], [7,10])
		return x.reverse
  end

  def wants_bfs_rice
  	x = @map.find_path_dijkstra([0,0], [7,10])
		return x.reverse
  end
end

profiler = MethodProfiler.observe Hanayo
rin_knows_hanayo = Hanayo.new
rin_knows_hanayo.wants_astar_rice
rin_knows_hanayo.wants_dijkstra_rice
rin_knows_hanayo.wants_bfs_rice
puts profiler.report