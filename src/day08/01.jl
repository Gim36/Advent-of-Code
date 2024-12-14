module julia_2024
using Combinatorics

function is_field(i::Int, j::Int, n::Int, m::Int)
    return i >= 1 && i <= n && j >= 1 && j <= m
end

function day081()
    a = Dict{Char,Vector{Tuple{Int,Int}}}()
    b = Set{Tuple{Int,Int}}()
    n = 0
    m = 0
    while true
        input = readline()
        if input == ""
            break
        end

        n += 1
        m = 0
        for char in input
            m += 1
            pos = (n, m)
            if char != '.'
                try
                    push!(a[char], pos)
                catch
                    a[char] = [pos]
                end
            end
        end
    end

    for v in values(a)
        unique_pairs = collect(combinations(v, 2))
        for pair in unique_pairs
            for i in 1:2
                c = (2 * pair[i][1] - pair[3-i][1], 2 * pair[i][2] - pair[3-i][2])
                if is_field(c[1], c[2], n, m)
                    push!(b, c)
                end
            end
        end
    end

    return length(b)
end

println(day081())

end # module julia_2024
