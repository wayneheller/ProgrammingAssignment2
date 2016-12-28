################################################################################################################################################
## R-Programming Week#2 Peer Graded Assignment                                                                                                ##
## 12/28/2016                                                                                                                                 ##
## Wayne Heller                                                                                                                               ##
##                                                                                                                                            ##
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.                                               ##
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.                                  ##
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve retrieves the inverse from the cache.         ##
################################################################################################################################################

## makeCacheMatrix() creates a special "matrix", which is really a list containing functions to:
## set the values of the matrix
## get the values of the matrix
## set the values of the inverse matrix
## get the values of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
 	inv_m <- NULL				## Initialize the inverse matrix internal variable when first called
	set <- function(y) {			## The set function is used to set a new matrix object w/o needing to call the create function again
      	x <<- y				## The assumption is the what is passed is a matrix object (no error checking!)
            inv_m <<- NULL			## Need to reinitialize the inverse matrix since it will need to be recalculated; otherwise,
							## it will return the last one calculated
         	message("the set method called")
		}
      get <- function() x
      setinvmatrix <- function(inverse_matrix) inv_m <<- inverse_matrix
      getinvmatrix <- function() inv_m

      list(set = set, get = get,
              setinvmatrix = setinvmatrix,
              getinvmatrix = getinvmatrix)

}


## cacheSolve() calculates the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the matrix and 
## sets the value of the inverse matrix in the cache via the setinvmatrix function.

cacheSolve <- function(x) {
      ## Return a matrix that is the inverse of 'x'
	inv_m <- x$getinvmatrix()
      if(!is.null(inv_m)) {
		message("getting cached inversed matrix")
		return(inv_m)
	}
	data <- x$get()
	inv_m <- solve(data)
	x$setinvmatrix(inv_m)
	return(inv_m)

}
