module julia_2024

shift = [(-1, 0), (0, 1), (1, 0), (0, -1)]
@enum Field begin
    Dot
    Wall
    Plus
end

function is_field(i::Int, j::Int, n::Int, m::Int)
    return i >= 1 && i <= n && j >= 1 && j <= m
end

function check_for_loop(inputs::Vector{Vector{Field}}, i::Int, j::Int, next::Int=1)
    i_next = i + shift[next][1]
    j_next = j + shift[next][2]
    if is_field(i_next, j_next, length(inputs), length(inputs[1]))
        next_field = inputs[i_next][j_next]
        if next_field == Wall
            if inputs[i][j] == Plus
                return 1
            else
                inputs[i][j] = Plus
            end

            return check_for_loop(inputs, i, j, (next % 4) + 1)
        else
            return check_for_loop(inputs, i_next, j_next, next)
        end
    else
        return 0
    end
end

function day062()
    inputs::Vector{Vector{Field}} = []
    position = [0, 0]
    while true
        input = readline()
        if input == ""
            result = 0
            for i in 1:lastindex(inputs)
                for j in 1:lastindex(inputs[1])
                    if inputs[i][j] == Wall || [i, j] == position
                        continue
                    end

                    new_inputs = inputs
                    new_inputs[i][j] = Wall
                    result += check_for_loop(new_inputs, position[1], position[2])
                end
            end

            return result
        end

        push!(inputs, [])
        i = lastindex(inputs)
        for (j, char) in enumerate(input)
            to_push = Dot
            if char == '^'
                position = [i, j]
            elseif char == '#'
                to_push = Wall
            end

            push!(inputs[i], to_push)
        end
    end
end

println(day062())

end # module julia_2024
