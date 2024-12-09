module julia_2024

mutable struct Rule
    update::Int
    position::Int
    before::Vector{Int}
end

function day051()
    rules = Dict{Int,Rule}()
    found_break = false
    update = 0
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
                push!(rules[nums[2]].before, nums[1])
            catch
                rules[nums[2]] = Rule(0, -1, [nums[1]])
            end

            continue
        end

        update += 1
        i = 1
        nums = map(x -> begin
                value = parse(Int, x)
                try
                    rules[value].update = update
                    rules[value].position = i
                catch
                    rules[value] = Rule(update, i, [])
                end

                i += 1
                return value
            end, split(input, ","))

        check = true
        for (i, value) in enumerate(nums)
            try
                for x in rules[value].before
                    rule = rules[x]
                    if update == rule.update && rule.position > i
                        check = false
                        break
                    end
                end
            catch
                continue
            end

            if !check
                break
            end
        end

        if check
            index = div(length(nums), 2) + 1
            result += nums[index]
        end
    end
end

println(day051())

end # module julia_2024
