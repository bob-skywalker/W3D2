class Card
    VALUES = ("A".."Z").to_a

    def self.shuffled_pairs
        values = VALUES

        values = values.shuffle!.take(8) * 2 #[A - H * 2]

        values.map { |val| self.new(val, face_up = false)} 
    end

    def initialize(value,face_up = false)
        @face_up  = face_up
        @value = value
    end 

    def value
        @value
    end

    def hide
        @face_up = false 
    end

    def face_up
        @face_up = true 
    end 
    def face_up?
        @face_up
    end

    def to_s
        if face_up?
            value.to_s = " "
        end 
    end

    def ==(other_card)
        other_card.value == self.value 
    end
end 
