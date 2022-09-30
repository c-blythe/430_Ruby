require_relative "Entity.rb"

class Player < Entity
    :xp

    def level_up
        roll_hp = rand(100)
        roll_atk = rand(100)
        roll_def = rand(100)
        roll_spd = rand(100)
        
        case roll_hp
        when 0...52
        when 52...87
            @stat_hp += 10
        when 87...97
            @stat_hp += 20
        when 97...100
            @stat_hp += 30

        case roll_atk
        when 0...52
        when 52...87
            @stat_atk += 1
        when 87...97
            @stat_atk += 2
        when 97...100
            @stat_atk += 3

        case roll_def
        when 0...52
        when 52...87
            @stat_def += 1
        when 87...97
            @stat_def += 2
        when 97...100
            @stat_def += 3

        case roll_spd
        when 0...52
        when 52...87
            @stat_spd += 1
        when 87...97
            @stat_spd += 2
        when 97...100
            @stat_atk += 3
    end 

    def gain_xp(amt)
        xp += amt
    end


end