## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inm <- NULL
  set <- function(y) {
    x <<- y
    inm <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) inm <<- solve
  getsolve <- function() inm
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inm <- x$getsolve()
  if(!is.null(inm)) {
    message("getting cached data")
    return(inm)
  }
  data <- x$get()
  inm <- solve(data, ...)
  x$setsolve(inm)
  inm
}

#Input
him2 <- matrix(1:4,2,2)

#Trial Run
cacheSolve(makeCacheMatrix(him2))
