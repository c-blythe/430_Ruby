require_relative "./Entity.rb"

class Enemy < Entity
    attr_accessor :total_xp, :text

    def set_text(text)
        @text = text
    end

    def print_text()
        puts text
    end
end