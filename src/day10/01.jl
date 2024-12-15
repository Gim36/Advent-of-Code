module julia_2024

shift = [(-1, 0), (0, 1), (1, 0), (0, -1)]

function is_field(i::Int, j::Int, n::Int, m::Int)
    return i >= 1 && i <= n && j >= 1 && j <= m
end

function count_score(inputs::Vector{Vector{Int}}, i::Int, j::Int, used=Set{Tuple{Int,Int}}())
    n = length(inputs)
    m = length(inputs[1])
    result = 0
    for next in shift
        i_next = i + next[1]
        j_next = j + next[2]
        if is_field(i_next, j_next, n, m) && inputs[i_next][j_next] == inputs[i][j] + 1
            cur = (i_next, j_next)
            if inputs[i_next][j_next] == 9 && !(cur in used)
                result += 1
                push!(used, cur)
            else
                result += count_score(inputs, i_next, j_next, used)
            end
        end
    end

    return result
end

function day101()
    inputs::Vector{Vector{Int}} = []
    starts = Vector{Tuple{Int,Int}}()
    while true
        input = readline()
        if input == ""
            result = 0
            for start in starts
                result += count_score(inputs, start[1], start[2])
            end

            return result
        end

        push!(inputs, [])
        i = lastindex(inputs)
        for (j, char) in enumerate(input)
            char = parse(Int, char)
            if char == 0
                push!(starts, (i, j))
            end

            push!(inputs[i], char)
        end
    end
end

println(day101())

end # module julia_2024
