##### Parallelization #####

## Set number of workers
addprocs(6)

## Need to declare variables accessible across cores as global
@everywhere T = 10

#= For variables inside the parallel for loop
that are modified within iterations: =#
SharedArray()

## Parallel loop

@parallel for(ix = 1:1:nx)
    # ...
end

## To synchronize before the code continues:
@sync @parallel for(ix = 1:1:nx)
    # ...
end
