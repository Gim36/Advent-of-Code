module julia_2024

function is_safe(input::String)
    parts = map(x -> parse(Int, x), split(input))

    if length(parts) < 2
        return false
    end

    last = parts[1]
    is_increasing = parts[2] > last

    for i in 2:lastindex(parts)
        difference = parts[i] - last
        if (is_increasing && (difference < 1 || difference > 3)) ||
           (!is_increasing && (difference > -1 || difference < -3))
            return false
        end
        last = parts[i]
    end

    return true
end

function day02()
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

println(day02())

end # module julia_2024
