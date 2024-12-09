module julia_2024

shift = [(-1, 0), (0, 1), (1, 0), (0, -1)]
@enum Field begin
    Dot
    Wall
    X
end

function is_field(i::Int, j::Int, n::Int, m::Int)
    return i >= 1 && i <= n && j >= 1 && j <= m
end

function count_steps(inputs::Vector{Vector{Field}}, i::Int, j::Int, next::Int=1, steps::Int=1)
    i_next = i + shift[next][1]
    j_next = j + shift[next][2]
    if is_field(i_next, j_next, length(inputs), length(inputs[1]))
        next_field = inputs[i_next][j_next]
        if next_field == Wall
            return count_steps(inputs, i, j, (next % 4) + 1, steps)
        elseif next_field == Dot
            inputs[i_next][j_next] = X
            return count_steps(inputs, i_next, j_next, next, steps + 1)
        else
            return count_steps(inputs, i_next, j_next, next, steps)
        end
    else
        return steps
    end
end

function day061()
    inputs::Vector{Vector{Field}} = []
    position = [0, 0]
    while true
        input = readline()
        if input == ""
            return count_steps(inputs, position[1], position[2])
        end

        push!(inputs, [])
        i = lastindex(inputs)
        for (j, char) in enumerate(input)
            to_push = Dot
            if char == '^'
                to_push = X
                position = [i, j]
            elseif char == '#'
                to_push = Wall
            end

            push!(inputs[i], to_push)
        end
    end
end

println(day061())

end # module julia_2024
