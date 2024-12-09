module julia_2024

function day011()
    array1 = Int[]
    array2 = Int[]
    while true
        input = readline()
        if input == ""
            break  # End of input
        end

        parts = split(input)
        push!(array1, parse(Int, parts[1]))
        push!(array2, parse(Int, parts[2]))
    end

    array1 = sort(array1)
    array2 = sort(array2)
    dist = 0
    for i in eachindex(array1)
        dist += abs(array1[i] - array2[i])
    end
    return dist
end

println(day011())

end # module julia_2024
