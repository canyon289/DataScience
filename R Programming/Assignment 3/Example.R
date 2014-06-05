makeVector <- function(x = numeric()) {
    m <- NULL #Sets m to null
    set <- function(y) { #Creates function with sets y to x
        x <<- y
        m <<- NULL
    }
    get <- function() x   #Get returns value of x
    setmean <- function(mean) m <<- mean  #sets value of mean
    getmean <- function() m #Returns value of mean
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}


cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}