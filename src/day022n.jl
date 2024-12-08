module julia_2024

function is_safe(parts::Vector{Int}, bad_found::Bool=true)
    if length(parts) < 2
        return true
    end

    get_difference = parts[2] > parts[1] ? (x, y) -> x - y : (x, y) -> y - x
    for i in 2:lastindex(parts)
        difference = get_difference(parts[i], parts[i-1])
        if (difference < 1 || difference > 3)
            if (bad_found)
                return false
            else
                return is_safe(deleteat!(copy(parts), i - 1)) || is_safe(deleteat!(parts, i))
            end
        end
    end

    return true
end

function can_be_safe(parts::Vector{Int})
    for i in parts
        if is_safe()
            return true
        end
    end
end

function day02()
    counter = 0
    while true
        input = readline()
        if input == ""
            return counter
        end

        if is_safe(map(x -> parse(Int, x), split(input)), false)
            counter += 1
        end
    end
end

println(day02())

end # module julia_2024
