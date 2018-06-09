function collatz(n)
    if n < 2 || typeof(n) != Int64
        return "Sorry: n must be an integer greater than 1"
    end
    i = 0
    while n != 1
        if n % 2 == 0
            n = n/2
        else
            n = (n*3) + 1
        end
        i += 1
    end
    return i
end

function collatz_sequence_p(n)
    tic()
    cv = SharedArray{Int64}(n)
    @parallel for i in 2:n
        cv[(i-1)] = collatz(i)
    end
    return toc() #cv
end

function collatz_sequence(n)
    tic()
    cv = zeros(n)
    for i in 2:n
        cv[(i-1)] = collatz(i)
    end
    return toc() #cv
end



#= Compare times to run collatz conjecture between parallel and non-parallelised
 functions =#
cv = collatz_sequence(100000)
addprocs(4)
cv_p = collatz_sequence_p(100000)

collatz_time = zeros(5)
collatz_time_p = zeros(5)

for i in 1:5
    collatz_time[i] = collatz_sequence(100000)
end

for i in 1:5
    collatz_time_p[i] = collatz_sequence_p(100000)
end

mean(collatz_time)
mean(collatz_time_p)
