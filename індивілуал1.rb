# === Оптимізація розподілу товарів на складі ===

# Дані
items = [
  { id: 1, popularity: 10 },
  { id: 2, popularity: 20 },
  { id: 3, popularity: 5 }
]

shelves = [1, 2, 3] # 1 - найбільш зручна полиця

# Функція оптимізації
def optimize_warehouse(items, shelves)
  # Сортуємо товари за популярністю (спаданням)
  sorted_items = items.sort_by { |item| -item[:popularity] }

  # Сортуємо полиці за зручністю (зростанням)
  sorted_shelves = shelves.sort

  # Розподіляємо товари по полицях
  optimized_allocation = sorted_items.zip(sorted_shelves).map do |item, shelf|
    { item_id: item[:id], shelf: shelf }
  end

  optimized_allocation
end

# Виклик функції
result = optimize_warehouse(items, shelves)

# Вивід результату
puts "Оптимальний розподіл товарів по полицях:"
result.each do |allocation|
  puts "Товар #{allocation[:item_id]} -> Полиця #{allocation[:shelf]}"
end
