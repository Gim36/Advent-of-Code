module julia_2024

function day02()
    while true
        input = readline()
        if input == ""
            break  # End of input
        end

        parts = split(input)
        last = parse(Int, parts[2])
        difference = last - parse(Int, parts[1])
        if (difference > 0)
            for i in 3:lastindex(parts)
                part = parse(Int, parts[i])
                difference = part - last
                last = parts[i]
            end
        end
    end
end

println(day02())

end # module julia_2024
