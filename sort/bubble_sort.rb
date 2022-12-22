# frozen_string_literal: true

def bubble_sort(a)
    a.length.times do
        a.each_with_index do |element, index|
            next if index == (a.length - 1)
            next unless element > a[index + 1]

            element_2 = a[index + 1]
            a[index + 1] = element
            a[index] = element_2
        end
    end

    a
end
