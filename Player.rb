require_relative "./Entity.rb"

def clear()
    system("cls") || system("clear")
end

def input(text)
    puts(text)
    print("  >> ")
    input = gets.chomp.downcase
    if input == 'quit'
        exit(0)
    end
    return input
end

class Player < Entity
    attr_accessor :xp_to_level_up, :level, :encounter_list

    def initialize
        super('Player', 15, 1, 1, 2, 5, -1)
        @xp_to_level_up = 1
        @level = 0
        @encounter_list = [false] * 4
        @encounter_list[0] = true
    end

    def set_encounter_list(level)
        # encounter_list is a sort of adjacency list that maps certain enemies to whether or not they can be encountered
        # 0 - Slime
        # 1 - Gnome
        # 2 - Bear
        # 3 - Ouroboros
        case level
        when 1
            @encounter_list[1] = true
        when 3
            @encounter_list[2] = true
        when 100
            @encounter_list[3] = true
        end 
    end

    def level_up
        roll_hp, count1 = self.roll_stat([1] * 15)
        roll_atk, count2 = self.roll_stat([8, 5, 4, 3])
        roll_def, count3 = self.roll_stat([8, 5, 4, 3])
        @stat_hp += roll_hp 
        @stat_atk += roll_atk
        @stat_def += roll_def

        set_encounter_list(@level)
    end 

    def gain_xp(amt)
        @xp += amt
        @xp_to_level_up -= amt
        if @xp_to_level_up <= 0
            @xp_to_level_up = 100
            self.level_up
            @level += 1
        end
    end
end