## Put comments here that give an overall description of what your
## functions do

## first i create the function with an empty matrix.
## then i create an empty variable (m) to store the cache
## set is used to set or update with new value (y)
## get returns the current matrix
## cacheinversion computes and caches the inverse of the matrix (x)

## Write a short comment describing this function
## m is where the cache will be stored, i used the same names of the example
## the solve function is going to compute the inverse

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {
    x
  }
  
  cacheinversion <- function() {
    if (!is.null(m)) {
      message("Getting cached inverse.")
      return(m)
    }
    inverse <- solve(x)
    m <<- inverse
    inverse
  }
  
  list(set = set, get = get, cacheinversion = cacheinversion)
  
}


## Write a short comment describing this function: 
## here i return the matrix that is inverse of x
## cacheSolve has one argument (cacheMatrix)
## checks if the function exists
## stops if the input is not valid
## calls the cacheinversion which retrieves the cached inverse of the matrix

cacheSolve <- function(cacheMatrix) {
  
  if (!is.function(cacheMatrix$cacheinversion)) {
    stop("Argument must be a matrix object created by makeCacheMatrix.")
  }
  
  cacheMatrix$cacheinversion()
}
