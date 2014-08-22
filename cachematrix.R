## The two functions below calculate matrix inversion using cached values


## Creates a matrix that caches its inverse
makeCacheMatrix <- function (mat = matrix()) {

    inv <- NULL
## Method to set the value of the matrix
    set <- function (matrix) {
            mat <<- matrix
            inv <<- NULL
    }

## Method the get the matrix
    get <- function() {
    	mat
    }

## Method to set the inverse of the matrix
    setInverse <- function (inverse) {
        inv <<- inverse
    }

## Method to get the inverse of the matrix
    getInverse <- function() {
        inv
    }

## Return the list of methods
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Compute the inverse of the matrix.
## If the inverse has already been calculated it simply retrieves the inverse
## from the cache.

cacheSolve <- function (x, ...) {

## get the inverse of matrix x using the method provided by the function above 
    inv_x <- x$getInverse()

## if the returned value is not null, i.e. inverse already calculated, 
## returns the "inv" value
    if( !is.null(inv_x) ) {
        return(inv_x)
    }
    else {
## Calculate the inverse of the given matrix using the "solve" function
         inv_x <- solve(x$get()) 

## Set the inverse to the calculated value
         x$setInverse(inv_x)
         return(inv_x)
    }
}
