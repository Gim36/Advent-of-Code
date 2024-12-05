module julia_2024

function is_safe(input::String)
    parts = map(x -> parse(Int, String(x)), split(input))
    last = parts[2]
    difference = last - parts[1]
    if (difference > 0)
        for i in 3:length(parts)
            difference = parts[i] - last
            if (difference < 1 || difference > 3)
                return false
            end
            last = parts[i]
        end
    elseif (difference < 0)
        for i in 3:length(parts)
            difference = last - parts[i]
            if (difference < 1 || difference > 3)
                return false
            end
            last = parts[i]
        end
    else
        return false
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
