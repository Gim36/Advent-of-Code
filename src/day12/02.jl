module julia_2024

shift = [(-1, 0), (0, 1), (1, 0), (0, -1)]

function is_field(i::Int, j::Int, n::Int, m::Int)
    return i >= 1 && i <= n && j >= 1 && j <= m
end

function mark_region(inputs::Vector{String}, visited::Matrix{Bool}, i::Int, j::Int, char::Char)
    n = lastindex(inputs)
    m = lastindex(inputs[1])
    area = 1
    perimeter = 0
    for next in shift
        i_next = i + next[1]
        j_next = j + next[2]
        if is_field(i_next, j_next, n, m)
            if inputs[i_next][j_next] != char
                perimeter += 1
            elseif !visited[i_next, j_next]
                visited[i_next, j_next] = true
                result = mark_region(inputs, visited, i_next, j_next, char)
                area += result[1]
                perimeter += result[2]
            end
        else
            perimeter += 1
        end
    end

    return [area, perimeter]
end

function day122()
    inputs = Vector{String}()
    while true
        input = readline()
        if input == ""
            break
        end

        push!(inputs, input)
    end


    n = lastindex(inputs)
    m = lastindex(inputs[1])
    visited = fill(false, n, m)
    result = 0
    for i in 1:n
        for j in 1:m
            if visited[i, j]
                continue
            end

            visited[i, j] = true
            char = inputs[i][j]
            values = mark_region(inputs, visited, i, j, char)
            result += values[1] * values[2]
        end
    end

    return result
end

println(day122())

end # module julia_2024
