require 'thread'

# Ім'я файлу для запису
file_name = "shared_file.txt"

# Блокування для уникнення конфліктів
mutex = Mutex.new

# Дані, які будуть записуватися потоками
data_to_write = {
  thread1: "Thread 1: Writing first set of data\n",
  thread2: "Thread 2: Writing second set of data\n",
  thread3: "Thread 3: Writing third set of data\n"
}

# Очищення файлу перед початком роботи
File.open(file_name, "w") {}

# Потоки
threads = []

data_to_write.each do |thread_name, data|
  threads << Thread.new do
    3.times do |i| # Повторюємо запис для наочності
      mutex.synchronize do
        File.open(file_name, "a") do |file|
          file.puts("#{thread_name} - Iteration #{i + 1}: #{data}")
        end
      end
      sleep(rand(0.1..0.5)) # Затримка для демонстрації потокової роботи
    end
  end
end

# Очікуємо завершення всіх потоків
threads.each(&:join)

puts "Запис завершено. Дані записані у #{file_name}."
