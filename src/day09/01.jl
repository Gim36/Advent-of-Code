module julia_2024

function day091()
    input = readline()
    a = Vector{Array{Int,1}}()
    for i in 1:lastindex(input)
        num = parse(Int, input[i])
        push!(a, [(i % 2 == 0) ? -1 : div(i, 2), num])
    end

    l = 2
    r = lastindex(a)
    while l < r
        if a[r][2] < a[l][2]
            a[l][2] -= a[r][2]
            new = copy(a[r])
            a[r][1] = -1
            insert!(a, l, new)
            l += 1
            r -= 1
        else
            a[l][1] = a[r][1]
            a[r][2] -= a[l][2]
            l += 2

            if a[r][2] == 0
                a[r][1] = -1
                r -= 2
            end
        end
    end

    counter = 0
    result = 0
    for i in 1:lastindex(a)
        if a[i][1] == -1
            return result
        end

        for j in 1:a[i][2]
            result += counter * a[i][1]
            counter += 1
        end
    end
end

println(day091())

end # module julia_2024
