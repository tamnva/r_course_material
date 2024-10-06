# Link to this R script is in the video description

# General syntax of try catch function
tryCatch(
  expr = {
    # Your code...
    # goes here...
    # ...
  },
  error = function(e){ 
    # (Optional)
    # Do this if an error is caught...
  },
  warning = function(w){
    # (Optional)
    # Do this if a warning is caught...
  },
  finally = {
    # (Optional)
    # Do this at the end before quitting the tryCatch structure...
  }
)


# Square root 
square_root <- function(x){
  tryCatch(
    expr = {
      sqrt(x)
    },
    error = function(e){ 
      message("There is an error")
      message(e)
      NA
    },
    warning = function(w){
      message("There is a warning")
      message(w)
      NA
    }
  ) 
}


b <- square_root("string")
a <- 3
