##makeCacheMatrix creats a matrix, and saves it to memory. it also contains
## a list of functions (set,get,getmatrix and setmatrix)

makeCacheMatrix <- function(x = matrix()) {
  #creates a null m
  m<-NULL
  set<-function(y){
    
    x<<-y
    m<<-NULL
  }
  
  
  get<-function() x
  
  ##s runs solve on matrix if it is invertible for the sake of this project
  ## no tests were run on the matrix to see if it's invertible or not.
  setmatrix<-function(solve) m<<- solve
  
  #returns matrix
  getmatrix<-function() m
  
  # a list of functions set,get, setmatrix, get matrix
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
}


## cacheSolve returns the inverse of the matrix that is in the cache memory

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  # gets the matrix using the get function in makecachematrix
  matrix<-x$get()
  # solves it...by returning its inverse to 'm'
  
  
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
  
  
}
