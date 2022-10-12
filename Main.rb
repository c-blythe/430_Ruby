require_relative "./Enemy.rb"
require_relative "./Player.rb"
require_relative "./EnemyCreator.rb"
require_relative "./CombatUtils.rb"

def clear()
    system("cls") || system("clear")
end

def text(time, text)
    puts(text)
    sleep(time)
end

def input(text)
    puts(text)
    print("  >> ")
    input = gets.chomp.downcase
    if input == 'quit' || input == 'exit'
        text(1.5, "Without a protector, this world shall surely fall")
        clear()
        exit(0)
    end
    return input
end

clear()

puts("This game is meant to be played in fullscreen mode")
sleep(2)
clear()
sleep(1)
puts()
puts <<-'EOF'
• ▌ ▄ ·.  ▄· ▄▌     ▄▄·             ▄▄▌       ▄▄ •  ▄▄▄· • ▌ ▄ ·. ▄▄▄ .
·██ ▐███▪▐█▪██▌    ▐█ ▌▪▪     ▪     ██•      ▐█ ▀ ▪▐█ ▀█ ·██ ▐███▪▀▄.▀·
▐█ ▌▐▌▐█·▐█▌▐█▪    ██ ▄▄ ▄█▀▄  ▄█▀▄ ██▪      ▄█ ▀█▄▄█▀▀█ ▐█ ▌▐▌▐█·▐▀▀▪▄
██ ██▌▐█▌ ▐█▀·.    ▐███▌▐█▌.▐▌▐█▌.▐▌▐█▌▐▌    ▐█▄▪▐█▐█ ▪▐▌██ ██▌▐█▌▐█▄▄▌
▀▀  █▪▀▀▀  ▀ •     ·▀▀▀  ▀█▄▀▪ ▀█▄▀▪.▀▀▀     ·▀▀▀▀  ▀  ▀ ▀▀  █▪▀▀▀ ▀▀▀ 
EOF
sleep(2)
name = "Carson"
input = ""
player = Player.new
player.gain_xp(1)

def prologue(player, name)
    input = input("Press enter to continue, or type 'skip' to skip the dialogue")
    if input == 'skip'
        return
    end
    puts()
    clear()

    name = input("Hello there, adventurer, what is your name?")

    puts()
    text(1, name + "?  That is wonderful name indeed.")
    text(1.5, "I'm sorry to ask you, " + name + ", but I have a request of you")
    text(2, "Our world has been plagued by monsters and creatures that seek harm on our people")
    text(2.5, "I know you are not particularly of this world, and that you posses the tools to become a hero")
    text(2, "Will you become the hero you are destined to be and help us?")

    input = input("\t1.\tYes\n\t2.\tNo")
    while(input && input != 'yes' && input != '1') do
        clear()
        if input.downcase == 'no' || input.downcase == '2'
            text(2, "No? I'm terribly sorry, but I cannot accept that")
        else
            text(2, "I'm sorry, but I didn't quite get that, " + name)
        end
        text(1, "So I will ask once more")
        text(1, "Will you help our world?")
        input = input("  1.  Yes\n  2.  No")
    end

    clear()
    text(1, "Thank you, kind stranger.")
    text(1.5, "If I you will allow it, I can help you briefly")
    text(3, "As a matter of fact, the developer added me, the voice in your head reading lines on the computer, to do just that")
    input("Please press enter if you'd like me to continue")

    clear()
    text(0.8, "Perfect!")
    text(2, "By the way, whenever the '>>' appears, you can type 'quit' to just leave")
    text(2, "However, do note that you are a 'playtester' in saving this world")
    text(1.8, "If you leave, you completely doom this world to ruin")
    text(2, "You may feel free to run the program again, but that is another world")
    input("Please press enter to signify you're understanding of this")

    clear()
    text(1.2, "We'll start with talking about you")

    

    text(1, "You are a 'Player' character")
    text(2, "You're task is to fight enemies, gain experience, and fight stronger enemies")
    text(2.2, "Honestly, it's kind of like a grinding simulator, so I hope you enjoy that")
    input("This next bit is kind of complicated, but I'll help you through it once you press enter")

    clear()
    text(1, "Welcome to STATS 101")
    text(1, "Get it, like statistics class?")
    text(1.5, "I'm sorry")
    clear()
    text(1.5, "Anyway, I'm going to run you through how stats work")
    text(1.3, "You have a couple different stats:")
    text(1.5, "  HP\t\tYour life, and the most important stat.  Once you run out in a combat, you lose")
    text(1.5, "  Attack\tA crucial stat that increases the amount of damage you deal")
    text(1.5, "  Defense\tHelps reduce the damage you take, always helpful")
    text(2, "In this world, you may find weapons that can also change the amount of damage you deal")
    text(2, "These stats are what define you, as well as the enemies you will encounter")
    input("If you'd like to keep reading the stat descriptions, do NOT press enter")

    clear()
    text(1.5, "We're going to start off by rolling for your stats")
    text(2.8, "While the developer could have hard-coded a balanced stat line option, gambling on stats is more fun")
    text(1, "Here is your statline:")
    text(1.5, "  HP:  #{player.stat_hp}")
    text(1.5, "  ATK: #{player.stat_atk}")
    text(1.5, "  DEF: #{player.stat_def}")
    input("Would you kindly press the enter button so we may move on to enemies")

    clear()
    text(1, "Allow me now to talk about enemies")
    text(1, "We'll start with this slime")
    puts()
    slime = EnemyCreator.slime
    slime.print_text()
    puts()
    text(1, "As you can see, this is a slime")
    text(1, "It is quite slimey")
    text(1, "We'll try a round of combat")
    text(2, "Your goal will be to absolutely demolish on this fool")
    text(2, "In combat, you can 'Attack' the slime, 'Heal' yourself, or 'Flee' from the battle")
    input("The moment you press enter is the moment that we start combat, so grab a Caprisun and get ready")

    CombatUtils.combat_init(player, slime)

    sleep(2)
    clear()
    text(1, "Congrats on beating the slime!")
    text(1, "I hope")
    text(1, "I wasn't really looking")
    text(1.5, "I found out they have Candy Crush in this world")
    text(1, "Maybe you fought it")
    text(1, "Anyway")
    text(1.2, "You're almost ready to head off into the world")
    input("There's just one more thing I gotta mention")

    clear()
    text(1.4, "So, I have bad news")
    text(2, "The developer is very infamous for large-scale planning and small-scale execution")
    text(1.4, "Basically, they wanted to create a lot but created just a little")
    text(1.5, "We're gonna blame this on ADHD and depression")

    clear()
    text(1.5, "When it comes to it, this is essentially a grinding simulator")
    text(1.5, "Think like fighting endless enemies to level up to fight more enemies")
    text(1, "But also worse because of poor development")
    text(1.5, "In the future, you will see your command list")
    text(1, "That will guide you")
    input("I wish you the best of luck in your endeavors")
end

prologue(player, name)

clear()
input = input("1. Encounter\n2. Stats\n3. Quit")

while (1) # input = 'quit' checked at input()
    clear()
    case input
    when '1','encounter','enemy'
        encounterable = player.encounter_list.filter { |b| b }
        enc_roll = rand(encounterable.length())

        case enc_roll
        when 0
            enemy = EnemyCreator.slime
        when 1
            enemy = EnemyCreator.gnome
        when 2
            enemy = EnemyCreator.bear
        when 3
            enemy = EnemyCreator.dragon
        end

        CombatUtils.combat_init(player, enemy)

    when '2','stats','stat'
        text(0, "These are #{name}'s stats:")
        text(0, "  HP:  #{player.stat_hp}")
        text(0, "  ATK: #{player.stat_atk}")
        text(0, "  DEF: #{player.stat_def}\n\n")

    when '3','quit','exit' # Redundant from input(), but added support for '3' and 'exit'
        exit(0)
    end

    input = input("1. Encounter\n2. Stats\n3. Quit")
end