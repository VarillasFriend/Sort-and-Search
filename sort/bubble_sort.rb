# frozen_string_literal: true

def bubble_sort(array)
    swaps = 1

    until swaps.zero?
        swaps = 0

        (array.length - 1).times do |index|
            next if array[index] <= array[index + 1]

            element2 = array[index + 1]
            array[index + 1] = array[index]
            array[index] = element2

            swaps += 1
        end
    end

    array
end
