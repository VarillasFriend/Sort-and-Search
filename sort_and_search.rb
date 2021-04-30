require 'colorize'

checkmark = "\u2713"

print "Length of the array: "
size = Integer(gets.chomp)

print "What number do you want to search for? "
number = Integer(gets.chomp)

puts "Algorithm:"
puts "[1] Quick Sort"
puts "[2] Merge Sort"
puts "[3] Bubble Sort"
puts "[4] Bogo Sort"

algorithm = Integer(gets.chomp)

if algorithm == 4 
    puts "You chose to use the Bogo Sort algorithm, this algorithm is based on shuffling the array and may therefore ".red + "never".red.bold + " stop sorting. If you are sure you want to continue, press 4, or otherwise select one of the previous algorithms".red
    algorithm = Integer(gets.chomp)
end

puts "Search:"
puts "[1] Binary Search"
puts "[2] Recursive Binary Search"

search = Integer(gets.chomp)

time_before = Time.now

print "Generating array..."

array = Array.new

size.times do
    array << rand(size)
end

print "#{checkmark.encode('utf-8')} \n"

def quick_sort(a)
    return a if a.length <= 1

    left = []
    right = []
    hi = a.length - 1

    pivot = a[hi]

    a.each_with_index do |element, index|
        unless index == hi
            element <= pivot ? left << element : right << element
        end
    end

    return *quick_sort(left), pivot, *quick_sort(right)
end

def merge_sort(a)
    if a.length > 2
        first = a[0...((a.length - 1) / 2)]
        second = a[((a.length - 1) / 2)...(a.length)]
        
        first = merge_sort(first)
        second = merge_sort(second)

        i = 0
        j = 0
        n = 0

        while i < first.length or j < second.length
            if i != first.length  and j != second.length
                if first[i] < second[j]
                    a[n] = first[i]
                    i += 1
                    n += 1
                else
                    a[n] = second[j]
                    j += 1
                    n += 1
                end 
            elsif i != first.length
                a[n] = first[i]
                i += 1
                n += 1
            else 
                a[n] = second[j]
                j += 1
                n += 1
            end                   
        end
    elsif a.length == 2 and a[0] > a[1]
        a_1 = a[1]
        a[1] = a[0]
        a[0] = a_1
    end

    return a
end

def bubble_sort(a)
    a.length.times do
        a.each_with_index do |element, index|
            unless index == (a.length - 1)
                if element > a[index + 1]
                    element_2 = a[index + 1]
                    a[index + 1] = element
                    a[index] = element_2
                end
            end
        end
    end

    return a
end

def bogo_sort(a)
    a_test = []
    finish = false

    until finish
        a_test = []

        a.each_with_index do |element, index|
            if index != a.length - 1 and element <= a[index + 1]
                a_test << element
            elsif index == a.length - 1 and element >= a[index - 1]
                a_test << element
            end
        end

        if a == a_test
            finish = true
        else
            a.shuffle!
        end
    end

    return a
end

print "Sorting array..."

array = case algorithm 
    when 1 then quick_sort(array)
    when 2 then merge_sort(array)
    when 3 then bubble_sort(array)
    when 4 then bogo_sort(array)
    else quick_sort(array)
end
print "#{checkmark.encode('utf-8')} \n"

def binary_search(a, n)
    number = nil

    until a.length == 1 or number != nil
        unless a[a.length / 2] == n

            a = a[a.length / 2] > n ? a[0...a.length / 2] : a[a.length / 2...a.length]
        else
            number = a[a.length / 2]
        end
    end

    return number
end

def recursive_binary_search(a, n)
    number = nil

    unless a.length == 1 or a[a.length / 2] == n
        a = a[a.length / 2] > n ? a[0...a.length / 2] : a[a.length / 2...a.length]
        recursive_binary_search(a, n)
    else 
        number = a[a.length / 2]
        return number
    end
end

print "Searching in array..."
print "#{checkmark.encode('utf-8')} \n"

if search == 2
    puts recursive_binary_search(array, number) != number ? "The number is not in the array" : "#{number} is in the array"
else
    puts binary_search(array, number) != number ? "The number is not in the array" : "#{number} is in the array"
end
time_after = Time.now

puts "Done in #{time_after - time_before}s"

print "Do you want to print the sorted array? "
show = gets.chomp.downcase

if show == 'yes' || show == 'true' || show == "y" || show == 'si' || show == 's'
    puts array
end