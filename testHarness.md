# Below is the input and output from R Studio Session used to test the functions in CacheMatrix.R

~~~
> source('CacheMatrix.R')
> x <- matrix (c(3,3.2,3.5,3.6), 2, 2)
> cm <- makeCacheMatrix(x)
> cacheSolve(cm)
     [,1]  [,2]
[1,]   -9  8.75
[2,]    8 -7.50
> x <- matrix (c(4,2,7,6), 2, 2)
> cm$set(x)
the set method called
> cacheSolve(cm)
     [,1] [,2]
[1,]  0.6 -0.7
[2,] -0.2  0.4
> cacheSolve(cm)
getting cached inversed matrix
     [,1] [,2]
[1,]  0.6 -0.7
[2,] -0.2  0.4
~~~