## The following functions illustrates how to handle environment variables

## Create a list containing a set of functions to handle a matrix data
## The set of functions are:
## set(y) set the original matrix
## get() returns the original matrix
## setinverse(inverse) sets the inverse matrix
## getinverse() returns the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Compute the inverse matrix for a square matrix caching the result the first
## time it is computed

cacheSolve <- function (x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cache data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

