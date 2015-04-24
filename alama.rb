# require 'method_profiler'
# require 'priority_queue'

# #
# # No Hanayo without rice. Well, let's make some boxes for
# # the rices.
# #
 
# class Ricebox
#   def initialize
#     @box = {}
#   end

#   def add_rice(name, edges)
#     @box[name] = edges
#   end

#   # calc heuristic
#   def heuristic(current_node, destination_node)
#     # Euclidean
#     # return ( Math.sqrt( ((current_node.x - destination_node.x) ** 2) + ((current_node.y - destination_node.y) ** 2) ) ).floor
#     # Manhattan
#     return (current_node.x - destination_node.x).abs + (current_node.y - destination_node.y).abs 
#   end
  
#   def dijkstra(start, finish)
#     maxint = (2**(0.size * 8 -2) -1)
#     distances = {}
#     previous = {}
#     nodes = PriorityQueue.new
    
#     @box.each do | vertex, value |
#       if vertex == start
#         distances[vertex] = 0
#         nodes[vertex] = 0
#       else
#         distances[vertex] = maxint
#         nodes[vertex] = maxint
#       end
#       previous[vertex] = nil
#     end
    
#     while nodes
#       smallest = nodes.delete_min_return_key

#       if smallest == finish
#         path = []
#         while previous[smallest]
#           path.push(smallest)
#           smallest = previous[smallest]
#         end
#         p "----Result----"
#         path.push(start)
#         return path.reverse.join(" -> ")
#         p "----Result----"
#       end
      
#       if smallest == nil or distances[smallest] == maxint
#          break            
#       end

#       p "Current:" + smallest
      
#       @box[smallest].each do | neighbor, value |
#         alt = distances[smallest] + @box[smallest][neighbor]
#         if alt < distances[neighbor]
#           distances[neighbor] = alt
#           previous[neighbor] = smallest
#           nodes[neighbor] = alt
#         end
#         p smallest + " to " + neighbor + ", cost: " + (alt - distances[smallest]).to_s
#       end
#     end
#     return distances.inspect
#   end


#   def getlower(openset,f_score)
#     lowest = openset.first
#     lowestvalue = f_score[lowest]
#     openset.each do |item|
#       if(f_score[item] < lowestvalue)
#         lowest = item
#         lowestvalue = f_score[item]
#       end
#     end
#     return lowest
# 	end

#   def astar(start, finish)
#   	closedset = []
#   	openset = [@box[start]]
#   	heuristic_cost_estimate = 10

#     maxint = (2**(0.size * 8 -2) -1)
#     distances = {}
#     previous = {}
#     nodes = PriorityQueue.new

#   	g_score = {}
#     f_score = {}
#     g_score[start]=0
#     f_score[start]=g_score[start] + heuristic_cost_estimate
    
#     @box.each do | vertex, value |
#       if vertex == start
#         distances[vertex] = 0
#         nodes[vertex] = 0
#       else
#         distances[vertex] = maxint
#         nodes[vertex] = maxint
#       end
#       previous[vertex] = nil
#     end
    
#     while nodes
#       current = getlower(openset,f_score)
      
#       if current == finish
#         path = []
#         while previous[current]
#           path.push(current)
#           current = previous[current]
#         end
#         p "----Result----"
#         path.push(start)
#         return path.reverse.join(" -> ")
#         p "----Result----"
#       end

#       openset.delete current
#       closedset.push current

#       p current

#       # @box[current].each do | neighbor, value |
#       #   p neighbor
#       # end
#     end
#     return distances.inspect
#   end
  
#   def to_s
#     return @box.inspect
#   end
# end

# class Hanayo
# 	def initialize		
# 		@ricebox = Ricebox.new
# 		@ricebox.add_rice('A', {'B' => 7, 'C' => 8})
# 		@ricebox.add_rice('B', {'A' => 7, 'F' => 2})
# 		@ricebox.add_rice('C', {'A' => 8, 'F' => 6, 'G' => 4})
# 		@ricebox.add_rice('D', {'F' => 8})
# 		@ricebox.add_rice('E', {'H' => 1})
# 		@ricebox.add_rice('F', {'B' => 2, 'C' => 6, 'D' => 8, 'G' => 9, 'H' => 3})
# 		@ricebox.add_rice('G', {'C' => 4, 'F' => 9})
# 		@ricebox.add_rice('H', {'E' => 1, 'F' => 3})
# 	end

# 	def get_rice
# 		puts '---------------------------'
# 		# puts @ricebox.dijkstra('A', 'H')
# 		puts @ricebox.astar('A', 'H')
# 		puts '---------------------------'
# 	end
# end

# profiler = MethodProfiler.observe Hanayo
# cute = Hanayo.new
# cute.get_rice
# puts profiler.report