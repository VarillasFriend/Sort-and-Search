# frozen_string_literal: true

def bogo_sort(a)
    a_test = []
    finish = false

    until finish
        a_test = []

        a.each_with_index do |element, index|
            if (index != a.length - 1) && (element <= a[index + 1])
                a_test << element
            elsif (index == a.length - 1) && (element >= a[index - 1])
                a_test << element
            end
        end

        if a == a_test
            finish = true
        else
            a.shuffle!
        end
    end

    a
end
