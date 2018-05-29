### Julia ###

# Find out version no.
versioninfo()

# This is a comment (obviously)

#=

Multiline
comment

=#

# Clear the console
clearconsole()

# Gives you the previous answer
a = 2
ans + 1

# Suppress output
ans;

# Print
println("Hello world!")

# Install, check, add, remove and deploy packages
Pkg.init()
Pkg.update()
Pkg.add("NEW PACKAGE")
Pkg.rm("REMOVE PACKAGE")
using PACKAGENAME

# For machine learning:
TensorFlow

# For large datasets:
Pandas

# For dataframes:
DataFrames

# Built in handling of irrational numbers
a = 2//3
b = 2//7
println(a+b)

# Using non-alphanumeric characters for variables
α = 7
β = 3
pi

println(α*β)

# See all variables, but is deprecated in next version 0.7
whos()

######################################################################

# Matrices and arrays
a = [1 2 3]
b = [4 5 6]
println(a + b)

# .+ or .* etc. does operation across lists
println(a .+ b)
println(a .* b)

a = Array{Float64}(2,2)
a = ["Economics" 2;
3.1 true]

# Passing by reference:
a = ["My string" 2; 3.1 true]
b = a
b[1,1] = "CHANGED"
println(a) # Super efficient since both a and b point to the same memory

println(pointer_from_objref(a))
println(pointer_from_objref(b))

# To duplicate in memory therefore
b = copy(a)
println(pointer_from_objref(a))
println(pointer_from_objref(b))

# Vector
a = [1,2,3]

# && and
# || or
# ! not
# == equals (Type agnostic)
2 == 2.0
# === equals, enforcing type
2 === 2.0

# Also does lazy evaluation - only evaluates what it needs to
2 > 3 && println("Hello world!")
3 > 2 || println("Hello world!")
# but...
(println("Hello world!") || 3 > 2)

isapprox(1.0, 1.1, atol = 0.1)
isapprox(1.0, 1.2, atol = 0.1)

# Metaprogramming

macro welcome(name)
    return :(println("Hello, ", $name, " like economics"))
end

# Graphs
using Plots
x = 1:10
y = x.^2
plot(x,y)
