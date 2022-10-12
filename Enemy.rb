require_relative "./Entity.rb"

class Enemy < Entity
    attr_accessor :base_xp

    def initialize(name, hp, atk, defense, min, max, xp)
        super(name, hp, atk, defense, min, max, xp)
        @base_xp = @xp
    end

    def set_text(text)
        @text = text
    end

    def print_text()
        puts text
    end
end