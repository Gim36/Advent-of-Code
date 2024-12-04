module julia_2024

function is_safe(input::String)
    parts = split(input)
    last = parse(Int, parts[2])
    difference = last - parse(Int, parts[1])
    if (difference > 0 || difference < 0)
        for i in 3:lastindex(parts)
            part = parse(Int, parts[i])
            difference = abs(part - last)
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
