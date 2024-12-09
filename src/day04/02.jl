module julia_2024

shift = [(1, 1), (-1, -1), (-1, 1), (1, -1)]
good = [('M', 'S'), ('S', 'M')]

function is_field(i::Int, j::Int, n::Int, m::Int)
    return i >= 1 && i <= n && j >= 1 && j <= m
end

function day042()
    inputs::Vector{String} = []
    while true
        input = readline()
        if input == ""
            break
        end

        push!(inputs, input)
    end

    n = length(inputs)
    m = length(inputs[1])
    result = 0
    for i in 1:n
        for j in 1:m
            if inputs[i][j] != 'A'
                continue
            end

            slots::Vector{Char} = []
            for x in shift
                i_next = i + x[1]
                j_next = j + x[2]
                if is_field(i_next, j_next, n, m)
                    push!(slots, inputs[i_next][j_next])
                end
            end

            if length(slots) == 4 && (slots[1], slots[2]) in good && (slots[3], slots[4]) in good
                result += 1
            end
        end
    end

    return result
end

println(day042())

end # module julia_2024
