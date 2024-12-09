module julia_2024

function day012()
    array1 = Int[]
    map2 = Dict{Int,Int}()
    while true
        input = readline()
        if input == ""
            break  # End of input
        end

        parts = split(input)
        push!(array1, parse(Int, parts[1]))

        key = parse(Int, parts[2])
        value = get(map2, key, 0)
        map2[key] = value + 1
    end

    score = 0
    for value in array1
        found = get(map2, value, 0)
        if found != 0
            score += value * map2[value]
        end
    end
    return score
end

println(day012())

end # module julia_2024
