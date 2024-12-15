module julia_2024

function day092()
    input = readline()
    a = Vector{Array{Int,1}}()
    for i in 1:lastindex(input)
        num = parse(Int, input[i])
        push!(a, [(i % 2 == 0) ? -1 : div(i, 2), num, false])
    end

    r = lastindex(a)
    while r > 1
        if a[r][1] == -1 || a[r][3] == true
            r -= 1
            continue
        end

        l = 2
        while l < r
            if a[l][1] != -1
                l += 1
                continue
            end

            if a[r][2] < a[l][2]
                a[l][2] -= a[r][2]
                new = copy(a[r])
                new[3] = true
                a[r][1] = -1
                insert!(a, l, new)
                break
            elseif a[r][2] == a[l][2]
                a[l] = copy(a[r])
                a[l][3] = true
                a[r][1] = -1
                break
            end

            l += 1
        end

        r -= 1
    end

    counter = 0
    result = 0
    for i in 1:lastindex(a)
        if a[i][1] == -1
            counter += a[i][2]
            continue
        end

        for j in 1:a[i][2]
            result += counter * a[i][1]
            counter += 1
        end
    end

    return result
end

println(day092())

end # module julia_2024
