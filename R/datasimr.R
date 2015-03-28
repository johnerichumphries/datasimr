#=================================================
# datasimr - package
# Simulate data given some data frame.
# author: John Eric Humphries johneric@uchicago.edu 
# other contributors: other results incorporate some functions from stack overflow.
#=================================================



#' Check if everything in a vector of numbers are integers
#' @param x a numbe or collection of numbers
#' @return Returns \code{TRUE} if all values in vector ar integers and otherwise returns \code{FALSE}
#' @examples
#' testInteger(3)
#' testInteger(c(10, 1))
testInteger <- function(x){
    test <- all.equal(x, as.integer(x), check.attributes = FALSE)
    if(test == TRUE){ return(TRUE) }
    else { return(FALSE) }
}


#' Simulates data with matching variable names and characteristics
#' @param data the data frame we want to learn from. 
#' @return Returns a simulated data frame.
#' @examples
#' simulateData(data,3)
simulateData <- function(data,missingness=F,discreteLength=100){
    sims = list()
    if (3==3) {
        names = names(data)
        print(names)
        for (name in names) {
                if (is.logical(data[[name]])==T) {
                    sims[[name]] = list('logical',
                                        prob=mean(data[[name]],na.rm=T),
                                        missing=0)
                } else if (is.numeric(data[[name]])==T) {
                    if (length(unique(data[[name]]))<=discreteLength) {
                        sims[[name]] = list('numeric-factor',
                            probs= summary(as.factor(data[[name]])) / length(data[[name]]),
                            levels = unique(data[[name]]),
                            missing = 0 )
                    } else if (testInteger(data[[name]])==T) {
                        sims[[name]] = list('numeric-integer',
                                            mean= mean(data[[name]],na.rm=T),
                                            sd  = sd(data[[name,na.rm=T]]),
                                            missing = 0)     
                    } else {
                       sims[[name]] = list('numeric-double',
                                           mean= mean(data[[name]],na.rm=T),
                                           sd  = sd(data[[name,na.rm=T]]),
                                           missing = 0)
                    }   
                } else if (is.factor(data[[name]])==T) {
                    sims[[name]] = list('factor',
                                    probs= summary(data[[name]]) / length(data[[name]]),
                                    levels = levels(data[[name]]),
                                    missing = 0)
                } else if (is.character(data[[name]])==T) {
                    if (length(unique(data[[name]]))<=discreteLength) {
                        sims[[name]] = list('character',
                                            probs= summary(as.factor(data[[name]])) / length(data[[name]]),
                                            levels = levels(data[[name]]),
                                            missing = 0 )
                    } else {
                        # what to do when we have a large number of strings.
                    }   
                }
        }
    }
    return(sims)
}

sims= simulateData(iris)

genData <- function(sims,n) {
    dta <- list()
    names <- names(sims)
    for (name in names) {
        if (sims[[name]][[1]] == "factor" | sims[[name]][[1]] == "character" | sims[[name]][[1]] == "numeric-factor" ) {
            dta[[name]] = sample(sims[[name]][["levels"]],n,replace=T, prob = sims[[name]][["probs"]])
        } else if (sims[[name]][[1]] == "numeric-double" ) {
            
        }
    }
    return(dta)
}

genData(sims,10)
