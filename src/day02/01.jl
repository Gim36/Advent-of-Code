module julia_2024

function is_safe(input::String)
    parts = map(x -> parse(Int, x), split(input))
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

function day021()
    counter = 0
    while true
        input = readline()
        if input == ""
            return counter
        end

        if is_safe(input)
            counter += 1
        end
    end
end

println(day021())

end # module julia_2024
