module julia_2024

rules = Dict{Int,Set{Int}}()
function compare(a, b)
    try
        return a in rules[b]
    catch
        return false
    end
end

function day052()
    global rules
    found_break = false
    result = 0
    while true
        input = readline()
        if input == ""
            if !found_break
                found_break = true
                continue
            else
                return result
            end
        end

        if !found_break
            nums = map(x -> parse(Int, x), split(input, "|"))
            try
                push!(rules[nums[2]], nums[1])
            catch
                rules[nums[2]] = Set{Int}(nums[1])
            end

            continue
        end

        nums = map(x -> parse(Int, x), split(input, ","))
        sorted_nums = sort(nums, by=x -> x, lt=compare)
        if nums != sorted_nums
            index = div(length(sorted_nums), 2) + 1
            result += sorted_nums[index]
        end
    end
end

println(day052())

end # module julia_2024
