require_relative "./Entity.rb"

class Enemy < Entity
    def set_text(text)
        @text = text
    end

    def print_text()
        puts text
    end
end