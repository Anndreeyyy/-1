class Menu
  attr_reader :categories

  def initialize(&block)
    @categories = []
    instance_eval(&block) if block_given?
  end

  def category(name, &block)
    cat = Category.new(name)
    cat.instance_eval(&block) if block_given?
    @categories << cat
  end

  def display
    puts "=== Меню ==="
    @categories.each do |cat|
      puts "\n#{cat.name}:"
      cat.items.each do |item|
        puts "  #{item.name} - #{item.price} грн. (#{item.description})"
      end
    end
  end

  class Category
    attr_reader :name, :items

    def initialize(name)
      @name = name
      @items = []
    end

    def item(name, price, description)
      @items << MenuItem.new(name, price, description)
    end
  end

  class MenuItem
    attr_reader :name, :price, :description

    def initialize(name, price, description)
      @name = name
      @price = price
      @description = description
    end
  end
end

# Опис Меню
menu = Menu.new do
  category "Закуски" do
    item "Салат Цезар", 120, "Курка, салат, соус цезар, сир пармезан"
    item "Брускетта", 80, "Тости з помідорами, базиліком і оливковою олією"
  end

  category "Основні страви" do
    item "Стейк Рібай", 300, "Соковитий яловичий стейк з соусом BBQ"
    item "Філе лосося", 250, "Лосось на грилі з овочами"
  end

  category "Напої" do
    item "Лимонад", 50, "Домашній лимонад з м'ятою"
    item "Еспресо", 30, "Свіжозварена кава"
  end
end

# Вивід Меню
menu.display
