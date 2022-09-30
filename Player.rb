require_relative "Entity.rb"

class Player < Entity
    def level_up
        gain_hp, count_hp = roll_stat({ 0=>40 , 1=>40 , 2=>15 , 3=>5 })
        gain_atk, count_atk = roll_stat({ 0=>40 , 1=>40 , 2=>15 , 3=>5 })
        gain_def, count_def = roll_stat({ 0=>40 , 1=>40 , 2=>15 , 3=>5 })
        gain_spd, count_spd = roll_stat({ 0=>40 , 1=>40 , 2=>15 , 3=>5 })
    end  

    def gain_xp(amt)
        xp += amt
    end


end