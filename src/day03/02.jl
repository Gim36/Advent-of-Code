module julia_2024

function safe_parse(input::String, l::Int, r::Int, bounds::Int)
    if l > bounds || r > bounds
        return NaN
    end

    str = input[l:r]
    if str == "" || isspace(first(str)) || isspace(last(str))
        return NaN
    end

    try
        return parse(Int, str)
    catch
        return NaN
    end
end

function day032()
    input = readline()
    result = 0
    enabled = true
    i = 1
    while i + 3 <= lastindex(input)
        if !enabled
            if input[i:i+3] != "do()"
                i += 1
            else
                enabled = true
                i += 4
            end

            continue
        end

        if i + 6 <= lastindex(input) && input[i:i+6] == "don't()"
            enabled = false
            i += 7
            continue
        end

        if input[i:i+3] != "mul("
            i += 1
            continue
        end

        l = i + 4
        r = l
        while r <= lastindex(input) - 1 && input[r] != ','
            r += 1
        end

        num1 = safe_parse(input, l, r - 1, lastindex(input))
        len1 = r - l
        if r >= lastindex(input) - 1 || len1 > 3 || isnan(num1)
            i += 4
            continue
        end

        l = r + 1
        r = l
        while r <= lastindex(input) && input[r] != ')'
            r += 1
        end

        num2 = safe_parse(input, l, r - 1, lastindex(input))
        len2 = r - l
        if r > lastindex(input) || len2 > 3 || isnan(num2)
            i += 4
            continue
        end

        result += num1 * num2
        i += 6 + len1 + len2
    end

    return result
end

println(day032())

end # module julia_2024
