function tokenize(text)
    return split(replace(replace(text,"("," ( "),")"," ) "))
end

function parenthesize(textArr)
    if textArr[1] == "("
        splice!(textArr,1)
        arr = []
        while textArr[1] != ")"
            push!(arr,parenthesize(textArr))
            splice!(textArr,1)
        end
    else
        return atomize(textArr[1])
    end
    return arr
end

function atomize(char)
    try
        return parse(Int64,char)
    end
    try
        return float(char)
    end
    return string(char)
end

function parser(text)
    return parenthesize(tokenize(text))
end

output = parser(test)

function line_evaluator(parsed)
    for i in 1:length(parsed)
        if typeof(parsed[i]) == SubString{String}
            if parsed[i] == "+"
                return line_evaluator(parsed[i+1]) + line_evaluator(parsed[i+2])
            elseif parsed[i] == "-"
                return line_evaluator(parsed[i+1]) - line_evaluator(parsed[i+2])
            elseif parsed[i] == "*"
                return line_evaluator(parsed[i+1]) * line_evaluator(parsed[i+2])
            elseif parsed[i] == "/"
                return line_evaluator(parsed[i+1]) / line_evaluator(parsed[i+2])
            elseif parsed[i] == "define"
                dict[parsed[i+1]] = line_evaluator(parsed[i+2])
            elseif parsed[i] == "=="
                return line_evaluator(parsed[i+1]) == line_evaluator(parsed[i+2])
            elseif parsed[i] == "if"
                if line_evaluator(parsed[i+1])
                    return line_evaluator(parsed[i+2])
                end


            end
        elseif typeof(parsed[i]) == Char
            return dict[string(parsed[i])]
        elseif typeof(parsed[i]) == Int64 || typeof(parsed[i]) == Float64
            return parsed[i]
        elseif typeof(parsed[i]) == Array{Any,1}
            return line_evaluator(parsed[i])

        end

    end

end

function eval_code(file)
    tic()
    global dict = Dict()
    f = open(file)
    lines = readlines(f)
    print("TSR Julia Lisp Interpreter 06-2018: \n")
    for line in lines
        print(line_evaluator(parser(line)),"\n")
    end
    toc()
end

eval_code("lisp instructions.txt")
