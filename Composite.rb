#общий интерфейс коспонентов
class Organisms
  def add(component)
    raise NotImplementedError, "#{self.class} has a problem with the 'add' method"
  end

  def remove(component)
    raise NotImplementedError, "#{self.class} has a problem with the 'remove' method"
  end

  def display
    raise NotImplementedError, "#{self.class} has a problem with the 'display' method"
  end
end

#листик
class Leaf < Organisms
  def initialize(name)
    @name = name
  end

  def display
    puts "  #{@name}"
  end
end

#контейнер
class Composite < Organisms
  def initialize(name)
    @name = name
    @children = []
  end

  def add(component)
    @children << component
  end

  def remove(component)
    @children.delete(component)
  end

  def display
    puts "Group of #{@name}:"
    @children.each { |child| child.display }
  end
end

#демонстрация реализации паттерна
root = Composite.new("Living Organisms")

plant_group = Composite.new("Plants")
plant_group.add(Leaf.new("Lily"))
plant_group.add(Leaf.new("Peony"))
plant_group.add(Leaf.new("Rose"))
plant_group.add(Leaf.new("Chrysanthemum"))

animal_group = Composite.new("Animals")
animal_group.add(Leaf.new("Horse"))
animal_group.add(Leaf.new("Snake"))
animal_group.add(Leaf.new("Cow"))
animal_group.add(Leaf.new("Chinchilla"))
root.add(plant_group)
root.add(animal_group)

root.display
