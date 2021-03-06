# This file was generated by Rcpp::compileAttributes
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' @name MaxDouble
#' @title Maximum value of a \code{double} typed variable
#' @description Maximum value of a \code{double} typed variable
#' @return Returns maximum value of a \code{double} typed variable in C++ compiler
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @examples
#' print(MaxDouble())
MaxDouble <- function() {
    .Call('mcga_MaxDouble', PACKAGE = 'mcga')
}

#' @name SizeOfDouble
#' @title Byte-length of a \code{double} typed variable
#' @description Byte-length of a \code{double} typed variable in computer memory
#' @return Returns the byte-length of a \code{double} typed variable in computer memory
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @examples
#' print(SizeOfDouble())
SizeOfDouble <- function() {
    .Call('mcga_SizeOfDouble', PACKAGE = 'mcga')
}

#' @name SizeOfInt
#' @title Byte-length of a \code{int} typed variable
#' @description Byte-length of a \code{int} typed variable in computer memory
#' @return Returns the byte-length of a \code{int} typed variable in computer memory
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @examples
#' print(SizeOfInt())
SizeOfInt <- function() {
    .Call('mcga_SizeOfInt', PACKAGE = 'mcga')
}

#' @name SizeOfLong
#' @title Byte-length of a \code{long} typed variable
#' @description Byte-length of a \code{long} typed variable in computer memory
#' @return Returns the byte-length of a \code{long} typed variable in computer memory
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @examples
#' print(SizeOfLong())
SizeOfLong <- function() {
    .Call('mcga_SizeOfLong', PACKAGE = 'mcga')
}

#' @name DoubleToBytes
#' @title Byte representation of a \code{double} typed variable
#' @description This function returns a vector of byte values with the length of \code{sizeof(double)} for a given \code{double} typed value
#' @param x A double typed value
#' @return A vector of byte values with the length of \code{sizeof(double)} for a given \code{double} typed value
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso DoubleVectorToBytes
#' @seealso BytesToDouble
#' @seealso ByteVectorToDoubles
#' @examples
#' print(DoubleToBytes(56.43))
DoubleToBytes <- function(x) {
    .Call('mcga_DoubleToBytes', PACKAGE = 'mcga', x)
}

#' @name DoubleVectorToBytes
#' @title Byte representation of a vector of \code{double} typed variables
#' @description This function returns a vector of byte values for a given vector of \code{double} typed values
#' @param d A vector of double typed values
#' @return returns a vector of byte values for a given vector of \code{double} typed values
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso DoubleToBytes
#' @seealso BytesToDouble
#' @seealso ByteVectorToDoubles
#' @examples
#' print(DoubleVectorToBytes(c(56.54, 89.7666, 98.565)))
DoubleVectorToBytes <- function(d) {
    .Call('mcga_DoubleVectorToBytes', PACKAGE = 'mcga', d)
}


#' @name BytesToDouble
#' @title Converting \code{sizeof(double)} bytes to a double value
#' @description This function converts \code{sizeof(double)} bytes to a double typed value
#' @param x A vector of bytes (unsigned chars in C++)
#' @return Corresponding \code{double} typed value for a given vector of bytes
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso DoubleVectorToBytes
#' @seealso DoubleToBytes
#' @seealso ByteVectorToDoubles
#' @examples
#' print(BytesToDouble(DoubleToBytes(56.43)))
BytesToDouble <- function(x) {
    .Call('mcga_BytesToDouble', PACKAGE = 'mcga', x)
}


#' @name ByteVectorToDoubles
#' @title Converting p * \code{sizeof(double)} bytes to a vector of p double values
#' @description This function converts a byte vector to a vector of doubles
#' @param b A vector of bytes (unsigned chars in C++)
#' @return Corresponding vector of \code{double} typed values for a given vector of bytes
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso DoubleVectorToBytes
#' @seealso BytesToDouble
#' @seealso ByteVectorToDoubles
#' @examples
#' a <- DoubleVectorToBytes(c(56.54, 89.7666, 98.565))
#' b <- ByteVectorToDoubles(a)
#' print(b)
ByteVectorToDoubles <- function(b) {
    .Call('mcga_ByteVectorToDoubles', PACKAGE = 'mcga', b)
}

#' @name OnePointCrossOver
#' @title One Point Crossover operation on the two vectors of bytes 
#' @description This function is a C++ wrapper for crossing-over of two byte vectors of candidate solutions
#' @param bytes1 A vector of bytes of the first parent
#' @param bytes2 A vector of bytes of the second parent
#' @param cutpoint Cut-point for the single point crossing-over
#' @return List of two byte vectors of offspring
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso UniformCrossOver
#' @seealso UniformCrossOverOnDoublesUsingBytes
#' @examples
#' b1 <- DoubleVectorToBytes(c(56.54, 89.7666, 98.565))
#' b2 <- DoubleVectorToBytes(c(79.76, 56.4443, 34.22121))
#' result <- OnePointCrossOver(b1,b2, round(runif(1,1,SizeOfDouble() * 3)))
#' print(ByteVectorToDoubles(result[[1]]))
#' print(ByteVectorToDoubles(result[[2]]))
OnePointCrossOver <- function(bytes1, bytes2, cutpoint) {
    .Call('mcga_OnePointCrossOver', PACKAGE = 'mcga', bytes1, bytes2, cutpoint)
}


#' @name OnePointCrossOverOnDoublesUsingBytes
#' @title One-point Crossover operation on the two vectors of doubles using their byte representations 
#' @description This function is a C++ wrapper for crossing-over of two double vectors of candidate solutions using their byte representations
#' @param d1 A vector of doubles of the first parent
#' @param d2 A vector of doubles of the second parent
#' @param cutpoint An integer between 1 and chromosome length for crossover cutting
#' @return List of two double vectors of offspring
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso OnePointCrossOver
#' @seealso UniformCrossOverOnDoublesUsingBytes
#' @examples
#' d1 <- runif(3)
#' d2 <- runif(3)
#' cutp <- sample(1:(length(d1)*SizeOfDouble()), 1)[1]
#' offspring <- OnePointCrossOverOnDoublesUsingBytes(d1,d2, cutp)
#' print("Parents:")
#' print(d1)
#' print(d2)
#' print("Offspring:")
#' print(offspring[[1]])
#' print(offspring[[2]])
OnePointCrossOverOnDoublesUsingBytes <- function(d1, d2, cutpoint) {
    .Call('mcga_OnePointCrossOverOnDoublesUsingBytes', PACKAGE = 'mcga', d1, d2, cutpoint)
}


#' @name TwoPointCrossOver
#' @title Two Point Crossover operation on the two vectors of bytes 
#' @description This function is a C++ wrapper for crossing-over of two byte vectors of candidate solutions
#' @param bytes1 A vector of bytes of the first parent
#' @param bytes2 A vector of bytes of the second parent
#' @param cutpoint1 First cut-point for the single point crossing-over
#' @param cutpoint2 Second cut-point for the single point crossing-over
#' @return List of two byte vectors of offspring
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso OnePointCrossOver
#' @seealso OnePointCrossOverOnDoublesUsingBytes
#' @seealso UniformCrossOverOnDoublesUsingBytes
#' @examples
#' b1 <- DoubleVectorToBytes(c(56.54, 89.7666, 98.565))
#' b2 <- DoubleVectorToBytes(c(79.76, 56.4443, 34.22121))
#' cutpoints <- sort(sample(1:(length(b1)*SizeOfDouble()), 2, replace = FALSE))
#' result <- TwoPointCrossOver(b1,b2, cutpoints[1], cutpoints[2])
#' print(ByteVectorToDoubles(result[[1]]))
#' print(ByteVectorToDoubles(result[[2]]))
TwoPointCrossOver <- function(bytes1, bytes2, cutpoint1, cutpoint2) {
    .Call('mcga_TwoPointCrossOver', PACKAGE = 'mcga', bytes1, bytes2, cutpoint1, cutpoint2)
}


#' @name TwoPointCrossOverOnDoublesUsingBytes
#' @title Two-point Crossover operation on the two vectors of doubles using their byte representations 
#' @description This function is a C++ wrapper for crossing-over of two double vectors of candidate solutions using their byte representations
#' @param d1 A vector of doubles of the first parent
#' @param d2 A vector of doubles of the second parent
#' @param cutpoint1 An integer between 1 and chromosome length for crossover cutting
#' @param cutpoint2 An integer between cutpoint1 and chromosome length for crossover cutting
#' @return List of two double vectors of offspring
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso TwoPointCrossOver
#' @seealso OnePointCrossOver
#' @seealso UniformCrossOver
#' @seealso OnePointCrossOverOnDoublesUsingBytes
#' @examples
#' d1 <- runif(3)
#' d2 <- runif(3)
#' cutpoints <- sort(sample(1:(length(d1)*SizeOfDouble()), 2, replace = FALSE))
#' offspring <- TwoPointCrossOverOnDoublesUsingBytes(d1,d2,cutpoints[1], cutpoints[2])
#' print("Parents:")
#' print(d1)
#' print(d2)
#' print("Offspring:")
#' print(offspring[[1]])
#' print(offspring[[2]])
TwoPointCrossOverOnDoublesUsingBytes <- function(d1, d2, cutpoint1, cutpoint2) {
    .Call('mcga_TwoPointCrossOverOnDoublesUsingBytes', PACKAGE = 'mcga', d1, d2, cutpoint1, cutpoint2)
}


#' @name UniformCrossOver
#' @title Uniform Crossover operation on the two vectors of bytes 
#' @description This function is a C++ wrapper for crossing-over of two byte vectors of candidate solutions
#' @param bytes1 A vector of bytes of the first parent
#' @param bytes2 A vector of bytes of the second parent
#' @return List of two byte vectors of offspring
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso OnePointCrossOver
#' @seealso UniformCrossOverOnDoublesUsingBytes
#' @examples
#' b1 <- DoubleVectorToBytes(c(56.54, 89.7666, 98.565))
#' b2 <- DoubleVectorToBytes(c(79.76, 56.4443, 34.22121))
#' result <- UniformCrossOver(b1,b2)
#' print(ByteVectorToDoubles(result[[1]]))
#' print(ByteVectorToDoubles(result[[2]]))
UniformCrossOver <- function(bytes1, bytes2) {
    .Call('mcga_UniformCrossOver', PACKAGE = 'mcga', bytes1, bytes2)
}


#' @name UniformCrossOverOnDoublesUsingBytes
#' @title Uniform Crossover operation on the two vectors of doubles using their byte representations 
#' @description This function is a C++ wrapper for crossing-over of two double vectors of candidate solutions using their byte representations
#' @param d1 A vector of doubles of the first parent
#' @param d2 A vector of doubles of the second parent
#' @return List of two double vectors of offspring
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso OnePointCrossOver
#' @seealso OnePointCrossOverOnDoublesUsingBytes
#' @examples
#' d1 <- runif(3)
#' d2 <- runif(3)
#' offspring <- UniformCrossOverOnDoublesUsingBytes(d1,d2)
#' print("Parents:")
#' print(d1)
#' print(d2)
#' print("Offspring:")
#' print(offspring[[1]])
#' print(offspring[[2]])
UniformCrossOverOnDoublesUsingBytes <- function(d1, d2) {
    .Call('mcga_UniformCrossOverOnDoublesUsingBytes', PACKAGE = 'mcga', d1, d2)
}



#' @name ByteCodeMutation
#' @title Mutation operator for byte representation of double values 
#' @description This function is a C++ wrapper for mutating byte representation of a given candidate solution
#' @param bytes1 A vector of bytes of a candidate solution
#' @param pmutation Probability of mutation
#' @return Byte vector of mutated solution
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso ByteCodeMutationUsingDoubles
#' @examples
#' set.seed(1246)
#' print(pi)
#' bytes <- DoubleToBytes(pi)
#' mutated.bytes <- ByteCodeMutation(bytes, 0.10) 
#' new.var <- BytesToDouble(mutated.bytes)
#' print(new.var)
ByteCodeMutation <- function(bytes1, pmutation) {
    .Call('mcga_ByteCodeMutation', PACKAGE = 'mcga', bytes1, pmutation)
}

#' @name ByteCodeMutationUsingDoubles
#' @title Mutation operator for byte representation of double values 
#' @description This function is a C++ wrapper for mutating byte representation of a given candidate solution
#' @param d A vector of doubles
#' @param pmutation Probability of mutation
#' @return Double vector of mutated solution
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso ByteCodeMutation
#' @examples
#' set.seed(1246)
#' print(pi)
#' print(exp(1))
#' new.var <- ByteCodeMutationUsingDoubles(c(pi, exp(1)), 0.10)
#' print(new.var)
ByteCodeMutationUsingDoubles <- function(d, pmutation) {
    .Call('mcga_ByteCodeMutationUsingDoubles', PACKAGE = 'mcga', d, pmutation)
}

#' @name ByteCodeMutationUsingDoublesRandom
#' @title Mutation operator for byte representation of double values 
#' @description This function is a C++ wrapper for mutating byte representation of a given candidate solution. This mutation operator 
#' randomly changes a byte in the range of [0,255].
#' @param d A vector of doubles
#' @param pmutation Probability of mutation
#' @return Double vector of mutated solution
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso ByteCodeMutation
#' @examples
#' set.seed(1246)
#' print(pi)
#' print(exp(1))
#' new.var <- ByteCodeMutationUsingDoublesRandom(c(pi, exp(1)), 0.10)
#' print(new.var)
ByteCodeMutationUsingDoublesRandom <- function(d, pmutation) {
    .Call('mcga_ByteCodeMutationUsingDoublesRandom', PACKAGE = 'mcga', d, pmutation)
}


#' @name EnsureBounds
#' @title Altering vector of doubles to satisfy boundary constraints
#' @description Byte based crossover and mutation operators can generate variables out of bounds of the decision variables. This function controls if variables are between their lower and upper bounds and if not, draws random numbers between these ranges. This function directly modifies the argument \code{doubles} and does not return a value. 
#' @param doubles A vector of doubles
#' @param mins A vector of lower bounds of decision variables
#' @param maxs A vector of upper bounds of decision variables
#' @return Function directly modifies the argument \code{doubles} and does not return a result.
#' @author Mehmet Hakan Satman - mhsatman@istanbul.edu.tr
#' @seealso byte_crossover
#' @seealso byte_mutation
#' @seealso mcga2
#' @examples
#' set.seed(1234)
#' x <- runif(10)
#' print(x)
#' # [1] 0.113703411 0.622299405 0.609274733 0.623379442 0.860915384 0.640310605
#' # [7] 0.009495756 0.232550506 0.666083758 0.514251141
#' EnsureBounds(x, mins=rep(0,10), maxs=rep(0.2,10))
#' print(x)
#' # [1] 0.113703411 0.138718258 0.108994967 0.056546717 0.184686697 0.058463168
#' # [7] 0.009495756 0.167459126 0.057244657 0.053364156
EnsureBounds <- function(doubles, mins, maxs) {
    invisible(.Call('mcga_EnsureBounds', PACKAGE = 'mcga', doubles, mins, maxs))
}


