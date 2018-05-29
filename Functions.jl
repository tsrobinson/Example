### Programming structures

## Julia likes functional programming
# Functions are first class citizens
# You can have functions of functions

# One-liner
myfunction1(var) = var + 1

# Multi-liner
function myfunction2(var1,var2="Float64",var3 = 1)
    output1 = var1+2
    output2 = var2 + 2
    output3 = var3 + 3
    return output1, output2, output3
end

# Function to define a function
function myfunction3(var1)
    function myfunction4(var2)
        answer = var1*var2
        return answer
    end
    return myfunction4
end


a = myfunction3(2)
a(2)
a = myfunction3(3)
a(2)

# map(function, list) - apply function to elements
map(floor,[1.2,5.6,3.7]) # like apply() in R

# reduce(function, list) - take function, and reduce list using function
reduce(+,[1.2,5.6,3.7])

mapreduce(x->x^2,+,[1,3])
