## these functions demonstrate caching of function results using wrapper objects

## wraps a matrix for use with cacheSolve

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## acts the same way as "solve" function but caches the result and only works on matrices wrapped with makeCacheMatrix

cacheSolve <- function(x, ...) {
  i <- x$getinv()
  print(i)
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  mat <- x$get()
  i <- solve(mat)
  x$setinv(i)
  i
}