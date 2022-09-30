module CombatUtils
    def self.combat_attack
        puts "attacked"
    end

    def self.update_label(label)
        #label.configure ('text' => "newText")
    end

    def self.combat_init()
    end

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

    def self.print_player_actions()
        puts('Available actions are:')
        puts('Attack')
        puts('Flee')
        puts()
    end
end