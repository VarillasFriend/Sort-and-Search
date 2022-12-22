# frozen_string_literal: true

def recursive_binary_search(a, n)
    number = nil

    if (a.length == 1) || (a[a.length / 2] == n)
        a[a.length / 2]

    else
        a = a[a.length / 2] > n ? a[0...a.length / 2] : a[a.length / 2...a.length]
        recursive_binary_search(a, n)
    end
end
