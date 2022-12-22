# frozen_string_literal: true

def quick_sort(array)
    return array if array.length <= 1

    pivot = array.pop

    left = []
    right = []

    array.each { |number| (number <= pivot ? left : right) << number }

    [quick_sort(left), pivot, quick_sort(right)]
end
