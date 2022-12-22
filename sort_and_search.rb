# frozen_string_literal: true

Dir['./sort/*'].sort.each { |file| require file }
Dir['./search/*'].sort.each { |file| require file }

require 'colorize'

checkmark = "\u2713"

print 'Length of the array: '
size = Integer(gets.chomp)

print 'What number do you want to search for? '
number = Integer(gets.chomp)

puts 'Algorithm:'
puts '[1] Quick Sort'
puts '[2] Merge Sort'
puts '[3] Bubble Sort'
puts '[4] Bogo Sort'

algorithm = Integer(gets.chomp)

if algorithm == 4
    puts 'You chose to use the Bogo Sort algorithm, this algorithm is based on shuffling the array and may therefore '.red + 'never'.red.bold + ' stop sorting. If you are sure you want to continue, press 4, or otherwise select one of the previous algorithms'.red
    algorithm = Integer(gets.chomp)
end

puts 'Search:'
puts '[1] Binary Search'
puts '[2] Recursive Binary Search'

search = Integer(gets.chomp)

time_before = Time.now

print 'Generating array...'

array = []

size.times do
    array << rand(size)
end

print "#{checkmark.encode('utf-8')} \n"

print 'Sorting array...'

array = case algorithm
        when 1 then quick_sort(array)
        when 2 then merge_sort(array)
        when 3 then bubble_sort(array)
        when 4 then bogo_sort(array)
        else quick_sort(array)
        end
print "#{checkmark.encode('utf-8')} \n"

print 'Searching in array...'
print "#{checkmark.encode('utf-8')} \n"

if search == 2
    puts recursive_binary_search(array,
                                 number) != number ? 'The number is not in the array' : "#{number} is in the array"
else
    puts binary_search(array,
                       number) != number ? 'The number is not in the array' : "#{number} is in the array"
end
time_after = Time.now

puts "Done in #{time_after - time_before}s"

print 'Do you want to print the sorted array? '
show = gets.chomp.downcase

puts array if %w[yes true y si s].include?(show)
