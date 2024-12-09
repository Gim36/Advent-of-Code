module julia_2024

operators = [+, *]

function day071()
    result = 0
    while true
        input = readline()
        if input == ""
            return result
        end

        nums = split(input, ":")
        test_value = parse(Int, nums[1])
        nums = map(x -> parse(Int, x), split(nums[2]))

        positions = length(nums) - 1
        combinations = collect(Iterators.product(fill(1:2, positions)...))
        for ops in combinations
            last_num = nums[1]
            for i in 1:positions
                last_num = operators[ops[i]](last_num, nums[i+1])
            end

            if last_num == test_value
                result += last_num
                break
            end
        end
    end
end

println(day071())

end # module julia_2024
