class Entity
    attr_accessor :name, :stat_hp, :stat_atk, :stat_def, :damage_min, :damage_max, :xp, :text

    def initialize(name, hp, atk, defense, min, max, xp)
        @name = name
        @stat_hp = hp
        @stat_atk = atk
        @stat_def = defense
        @damage_min = min
        @damage_max = max
        @xp = xp
    end

    def damage_roll
        return rand((@damage_max + 1) - @damage_min) + @damage_min
    end
    
    def attack(enemy)
        damage_dealt = 12
    end

    """
    Rolls a stat for any entity.  For players, this is used to add
    to the stat (and therefore will not be very high).  For enemies,
    this is the process of rolling their entire statline (and therefore
    must be higher proportional to difficulty).

    The input is formatted as a dictionary {key => value} such that 
    they keys are the percentages as an int and the values are the
    associated stat that percentage corresponds to.

    The sum of the percentages SHOULD equal 100 for consistency.  However,
    the stat_roll is pulling a random number based off of the sum.  Instead of
    it being a true percent, it will be percentage/sum chance

    E.g. { 2 => 50 , 3 => 35 , 4 => 10 , 5 => 5 }
    for a player's level up roll corresponds to
    50% of stat +2
    35% of stat +3
    10% of stat +4
     5% of stat +5
    """
    def roll_stat(list_stat_chance)
        sum = 0
        for i in list_stat_chance
            sum += i
        end

        # Generates a random number between 1 - sum inclusive
        stat_roll = rand(sum) + 1
        xp_bonus = 0

        for i in 0...list_stat_chance.length()
            stat_roll -= list_stat_chance[i]
            xp_bonus += 1
            if stat_roll <= 0
                return i, xp_bonus
            end
        end 
        raise "It appears stat_roll was out of bounds.  Maybe check the percentage sum?"
        return nil
    end
end