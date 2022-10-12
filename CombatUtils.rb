module CombatUtils

    def self.print_enemy_text(entity)
        entity.print_text()
        puts()
        case rand(3)
        when 0
            puts(entity.name + " approaches!")
        when 1
            puts(entity.name + " ambushes you!")
        when 2
            puts(entity.name + " seeks to fight!")
        puts()
        end
    end

    def self.combat_init(player , enemy)
        clear()
        combat_print_log = []
        combat_print_log[0] = enemy.text
        player_curr_hp = player.stat_hp

        CombatUtils.print_enemy_text(enemy)
        sleep(3)
        while player_curr_hp > 0 && enemy.stat_hp > 0
            clear()
            combat_print_log[1] = "\nEnemy HP:  #{enemy.stat_hp}\n\n"
            combat_print_log[2] = "Player HP: #{player_curr_hp}/#{player.stat_hp}"
            valid_command = false
            while(!valid_command)
                for i in combat_print_log
                    puts i
                end
                puts()    
                cmd = input("  1.  Attack\n  2.  Heal\n  3.  Flee")

                case cmd
                when '1', 'attack'
                    valid_command = true
                    damage_roll = player.damage_roll * player.stat_atk
                    damage = damage_roll - (2*enemy.stat_def)
                    damage - damage < 0 ? 0 : damage
                    enemy.stat_hp -= damage
                    puts("\nYou attacked the #{enemy.name} for #{damage_roll} damage, but their defense blocked #{2*enemy.stat_def} for a total of #{damage} damage")
                when '2', 'heal'
                    valid_command = true
                    hp_healed = player.stat_hp / 3
                    player.stat_hp / 3 + player_curr_hp > player.stat_hp ? hp_healed = player.stat_hp - player_curr_hp : hp_healed = player.stat_hp / 3
                    player_curr_hp += hp_healed
                    puts("\nYou healed yourself for #{hp_healed} HP")
                when '3', 'flee'
                    valid_command = true
                    puts("You got away safely, nothing gained or lost")
                    return
                when '4', 'wait'
                    valid_command = true
                    puts("You sit by idly, allowing the enemy a free turn")
                else
                    clear()
                end
            end
            sleep(1.7)

            enem_damage_roll = enemy.damage_roll * enemy.stat_atk
            enem_damage =  enem_damage_roll - (2*player.stat_def)
            enem_damage = enem_damage < 0 ? 0 : enem_damage
            player_curr_hp -= enem_damage
            puts("\nThe #{enemy.name} attacked you for #{enem_damage_roll} damage, but your defense blocked #{2*player.stat_def} for a total of #{enem_damage} damage")
            puts("You are now at #{player_curr_hp} HP")
            sleep(2)
        end

        if enemy.stat_hp <= 0
            if player_curr_hp <= 0
                puts("\nThrough sheer will, you endure the #{enemy.name}'s attack long enough to kill it")
                sleep(1.8)
            end
            puts("You have slain the #{enemy.name} and gained #{enemy.xp} XP")
            player.gain_xp(enemy.xp)
        elsif player_curr_hp <= 0
            puts("\nYou died")
            sleep(1)
            puts("And with the fall of the hero, the world shall fall to ruin")
            sleep(2)
            clear()
            puts <<-'EOF'
  ________                        ________                     
 /  _____/_____    _____   ____   \_____  \___  __ ___________ 
/   \  ___\__  \  /     \_/ __ \   /   |   \  \/ // __ \_  __ \
\    \_\  \/ __ \|  Y Y  \  ___/  /    |    \   /\  ___/|  | \/
 \______  (____  /__|_|  /\___  > \_______  /\_/  \___  >__|   
        \/     \/      \/     \/          \/          \/       
            EOF
            sleep(1)
            exit(0)
        end
    end
end