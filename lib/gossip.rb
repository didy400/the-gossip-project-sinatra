require 'csv'

class Gossip
    attr_accessor :author, :content
    
   
    def initialize (author,content)
        @author= author
        @content = content
    end
    
    def save
      File.open("./db/gossip.csv", "ab") do |op| 
        op.write("#{@author},#{@content}\n")
        puts "#{@author} dit : #{@content}"
      end
    end

    def self.all
        all_gossips = []
        CSV.foreach("./db/gossip.csv").each do |row|
        gossip_temp << Gossip.new(row[0], row[1])
        all_gossips << gossip_temp
        end
      return all_gossips
    end

    def self.find(id)
      return self.all[id.to_i]
    end

    def self.update(author, content, id)
      row_array = CSV.read('db/gossip.csv')
      row_array.each.with_index do |row, index| 
        if (id.to_i + 1 ) == index
          row_array[index] = [author, content]
        end
      end
    end
end