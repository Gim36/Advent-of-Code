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
                parts2 = vcat(parts[1:i-1], parts[i+1:end])
                return is_safe(vcat(parts[1:i-2], parts[i:end])) || is_safe(parts2)
            end
        end
    end

    return true
end

function day022()
    counter = 0
    while true
        input = readline()
        if input == ""
            return counter
        end

        parts = map(x -> parse(Int, x), split(input))
        if is_safe(parts, false) || is_safe(parts[2:end], true)
            counter += 1
        end
    end
end

println(day022())

end # module julia_2024
