# frozen_string_literal: true

def merge_sort(array)
    if array.length > 2
        first = merge_sort array[0...array.length / 2]
        second = merge_sort array[array.length / 2...(array.length)]

        return merge(first, second)
    elsif array.length == 2 && array[0] > array[1]
        return array[1], array[0]
    end

    array
end

def merge(first, second)
    array = []
    i = 0
    j = 0

    until i == first.length && j == second.length
        array << if i != first.length && first[i] < (second[j] || first[i] + 1)
                     i += 1
                     first[i - 1]
                 else
                     j += 1
                     second[j - 1]
                 end
    end

    array
end
