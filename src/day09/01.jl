module julia_2024

function day091()
    input = readline()
    input = "12345"
    a = Vector{Array{Int,1}}()
    for i in 1:lastindex(input)
        num = parse(Int, input[i])
        push!(a, [(i % 2 == 0) ? -1 : div(i, 2), num])
    end

    l = 2
    r = lastindex(a)
    oldr = r
    while l < r
        if a[r][2] < a[l][2]
            a[l][2] -= a[r][2]
            insert!(a, l, a[r])
            l += 1
        else
            a[l][1] = a[r][1]
            a[r][2] -= a[l][2]
            l += 2

            if a[r][2] == 0
                oldr = r
                r -= 2
            end
        end
    end

    println(r)
    return a[1:r]

    counter = 0
    result = 0
    for i in 1:lastindex(a)
        if i > r
            return result
        end

        if a[i][1] == -1 || a[i][2] == 0
            continue
        end

        for j in 1:a[i][2]
            result += counter * a[i][1]
            counter += 1
        end
    end
end

println(day091())

end # module julia_2024
