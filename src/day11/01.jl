module julia_2024

function blink(memo::Dict{Tuple{Int,Int},Int}, stone::Int, amount::Int)
    if amount == 0
        return 1
    end

    try
        return memo[(stone, amount)]
    catch
    end

    result = 0
    if stone == 0
        result = blink(memo, 1, amount - 1)
    else
        digits = floor(Int, log10(stone)) + 1
        if digits % 2 == 0
            left = div(stone, 10^(digits ÷ 2))
            right = stone % 10^(digits ÷ 2)
            result = blink(memo, left, amount - 1) + blink(memo, right, amount - 1)
        else
            result = blink(memo, stone * 2024, amount - 1)
        end
    end

    memo[(stone, amount)] = result
    return result
end

function day111()
    input = readline()
    input = map(x -> parse(Int, x), split(input))
    memo = Dict{Tuple{Int,Int},Int}()
    return sum(blink(memo, stone, 25) for stone in input)
end

println(day111())

end # module julia_2024
