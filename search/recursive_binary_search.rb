# frozen_string_literal: true

def recursive_binary_search(a, n)
    return a[a.length / 2] if a.length == 1 || a[a.length / 2] == n

    recursive_binary_search(a[a.length / 2] > n ? a[0...a.length / 2] : a[a.length / 2...a.length], n)
end
