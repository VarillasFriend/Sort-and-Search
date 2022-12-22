# frozen_string_literal: true

def binary_search(a, n)
    number = nil

    until (a.length == 1) || !number.nil?
        if a[a.length / 2] == n
            number = a[a.length / 2]
        else

            a = a[a.length / 2] > n ? a[0...a.length / 2] : a[a.length / 2...a.length]
        end
    end

    number
end
