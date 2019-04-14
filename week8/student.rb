require_relative 'person'

class Student < Person 

    Level = 0
    def initialize(f,l)
      super(f,l)
      @knowledge_level = Level
    end

    def learn 
        @knowledge_level = @knowledge_level + 10
    end

    def slack
        @knowledge_level = @knowledge_level - 5 if @knowledge_level > 0
    end

    def bonus(mark)
        marks(mark)
    end

    private

    def marks(m)
        @knowledge_level = @knowledge_level + m
    end

end



