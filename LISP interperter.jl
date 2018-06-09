test = "(+ (+ 1 2) 1)"

function tokenize(text)
    return split(replace(replace(text,"("," ( "),")"," )"))
end

function parser(program)
    return read_from_tokens(tokenize(program))
end

function read_from_tokens(tokens)
    if length(tokens) == 0
        return "Error!"
    end

    token = tokens[1]
    tokens = tokens[2:length(tokens)]

    if token == "("
        L = []
        while tokens[1] != ")"
            append!(L,read_from_tokens(tokens))
            tokens = tokens[2:length(tokens)]
        end
        return L
    elseif token == ")"
        return "Error!"
    else
        return token
    end
end

parsed = parser(test)
