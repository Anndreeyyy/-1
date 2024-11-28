# Метод, що приймає масив чисел і блок для виконання операцій
def apply_operation(numbers)
  numbers.map { |num| yield(num) }
end

# Приклад використання
numbers = [1, 2, 3, 4, 5]

# Використання блоку для збільшення чисел на 2
result_add = apply_operation(numbers) { |num| num + 2 }
puts “Результат додавання 2 до кожного числа: #{result_add}”

# Використання блоку для множення чисел на 3
result_multiply = apply_operation(numbers) { |num| num * 3 }
puts “Результат множення кожного числа на 3: #{result_multiply}”

# Використання блоку для піднесення чисел до квадрату
result_square = apply_operation(numbers) { |num| num**2 }
puts “Результат піднесення кожного числа до квадрату: #{result_square}”
