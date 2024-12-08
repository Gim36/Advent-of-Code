module julia_2024

function is_safe(parts::Vector{Int})
    if length(parts) < 2
        return true
    end

    get_difference = parts[2] > parts[1] ? (x, y) -> x - y : (x, y) -> y - x
    for i in 2:lastindex(parts)
        difference = get_difference(parts[i], parts[i-1])
        if (difference < 1 || difference > 3)
            return false
        end
    end

    return true
end

function can_be_safe(parts::Vector{Int})
    for (i, _) in enumerate(parts)
        if is_safe(deleteat!(copy(parts), i))
            return true
        end
    end

    return false
end

function day02()
    counter = 0
    while true
        input = readline()
        if input == ""
            return counter
        end

        parts = map(x -> parse(Int, x), split(input))
        if is_safe(parts) || can_be_safe(parts)
            counter += 1
        end
    end
end

println(day02())

end # module julia_2024
