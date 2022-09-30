require_relative "./Entity.rb"
require_relative "./Enemy.rb"
require_relative "./EnemyCreator.rb"
require_relative "./CombatUtils.rb"


slime = EnemyCreator.slime
puts(slime.base_xp)
puts(slime.total_xp)