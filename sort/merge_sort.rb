# frozen_string_literal: true

def merge_sort(a)
    if a.length > 2
        first = a[0...((a.length - 1) / 2)]
        second = a[((a.length - 1) / 2)...(a.length)]

        first = merge_sort(first)
        second = merge_sort(second)

        i = 0
        j = 0
        n = 0

        while (i < first.length) || (j < second.length)
            if (i != first.length) && (j != second.length)
                if first[i] < second[j]
                    a[n] = first[i]
                    i += 1
                else
                    a[n] = second[j]
                    j += 1
                end
            elsif i != first.length
                a[n] = first[i]
                i += 1
            else
                a[n] = second[j]
                j += 1
            end
            n += 1
        end
    elsif (a.length == 2) && (a[0] > a[1])
        a_1 = a[1]
        a[1] = a[0]
        a[0] = a_1
    end

    a
end
