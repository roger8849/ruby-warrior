
class Player
  
  def play_turn(warrior)
    init!(warrior)
    do_something!(warrior)
    update_health!(warrior)
  end
  def init!(warrior)
    if @health.nil?
      @health = warrior.health
    end
    if @went_backward.nil?
      @went_backward = false
    end
  end
  def do_something!(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.look(:backward).any? { |space| space.enemy? }
      warrior.pivot!
    elsif warrior.look.any? { |space| space.enemy? }
      warrior.shoot!
    elsif warrior.feel(:backward).empty? && !@went_backward
      warrior.walk!(:backward)
    elsif warrior.feel(:backward).captive? && !@went_backward
      warrior.rescue!(:backward)
    elsif warrior.feel.empty?
      @went_backward = true
      if taking_damage?(warrior) && warrior.health < 10
        warrior.walk!(:backward)
      elsif taking_damage?(warrior) && warrior.health > 10
        warrior.walk!
      elsif
        if warrior.health < 20
          warrior.rest!
        elsif
          warrior.walk!
        end
      end
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif
      warrior.attack!
    end
  end
  
  
  def update_health!(warrior)
    @health = warrior.health
  end
  
  def taking_damage?(warrior)
    warrior.health<@health
  end
  
end
  
