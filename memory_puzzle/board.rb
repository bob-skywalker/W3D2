require './card.rb'
class Board
    DICTIONARY = (('a'..'h').to_a * 2 ).shuffle 


    def initialize
        @grid = Array.new(4) {Array.new(4)}
        populate.each do |row|
            p row 
        end 
    end

    def cards
        @cards
    end

    def [](position)
        row,col = position
        @grid[row][col] 
    end

    def []=(position, value)
        row,col = position
        @grid[row][col] = value
    end

    def populate
        @grid.map! do |arr|
            arr.map! do |el|
                if el.nil?
                    Card.new(DICTIONARY.pop, false).value
                end 
            end
        end 
    end

    def revealed?(pos) #[1,1]
       @grid[pos].face_up?
    end 


    def render
        initialize
        puts "  #{(0...4).to_a.join(" ")}"
        @grid.each_with_index do |arr,i|
            puts "#{i} #{arr[i]}"
        end 
    end 

    

    def won?
        @grid.all? do |row|
           row.all? {|el| el.revealed?}
        end 
    end 
end 
