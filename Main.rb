require_relative "./Enemy.rb"
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
sleep(1)
text(1, "Press enter to continue")
puts()
input = gets.chomp
clear()

input("Hello there, adventurer, what is your name?")
name = gets.chomp

puts()
text(1, name + "?  That is wonderful name indeed.")
text(1.5, "I'm sorry to ask you, " + name + ", but I have a request of you")
text(2, "Our world has been plagued by monsters and creatures that seek harm on our people")
text(2.5, "I know you are not particularly of this world, and that you posses the tools to become a hero")
text(2, "Will you become the hero you are destined to be and help us?")

input("\t1.\tYes\n\t2.\tNo")
while((input = gets.chomp).downcase && input != 'yes' && input != '1') do
    clear()
    if input.downcase == 'no' || input.downcase == '2'
        text(2, "No? I'm terribly sorry, but I cannot accept that")
    else
        text(2, "I'm sorry, but I didn't quite get that, " + name)
    end
    text(1, "So I will ask once more")
    text(1, "Will you help our world?")
    input("\t1.\tYes\n\t2.\tNo")
end

text(0.5, "Thank you, kind stranger.")
text(1.5, "I will teach you the fundamentals of this world to help you")
puts()

player = Player.new('Player', 10, 8, 1, 1, 1, 10)
slime = EnemyCreator.slime
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
puts(slime.damage_roll)
#dragon_infinity = EnemyCreator.dragon_infinity
#CombatUtils.print_enemy_text(dragon_infinity)

while((input = gets.chomp) != "exit") do
    print(input)
end




