module julia_2024

shift = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (-1, -1), (-1, 1), (1, -1)]
next = ['M', 'A', 'S']

function is_field(i::Int, j::Int, n::Int, m::Int)
    return i >= 1 && i <= n && j >= 1 && j <= m
end

function day041()
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
            if inputs[i][j] != 'X'
                continue
            end

            for x in shift
                found = true
                for k in 1:3
                    i_next = i + k * x[1]
                    j_next = j + k * x[2]
                    if !is_field(i_next, j_next, n, m) || inputs[i_next][j_next] != next[k]
                        found = false
                        break
                    end
                end

                if found
                    result += 1
                end
            end
        end
    end

    return result
end

println(day041())

end # module julia_2024
