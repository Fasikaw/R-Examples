#' Calculate number of heat waves
#'
#' This function takes a dataframe of heat waves, as created by
#' \code{\link{gen_hw_set}}, and calculates the number of heat waves in
#' the dataframe.
#'
#' To calculate the number of heat waves, this function determines the number
#' of rows in the dataframe, since \code{\link{gen_hw_set}} outputs a
#' dataframe with one and only one row per heat wave.
#'
#' @param hw_datafr A dataframe of heat waves and their characteristics, as
#'    created by \code{\link{gen_hw_set}}
#'
#' @return A numeric value with the number of heat waves in a dataframe of
#'    heat waves, as generated by \code{\link{gen_hw_set}}.
#'
#' @note This function is an example of a function that can be created and
#'    used to explore heat waves using the \code{\link{apply_all_models}}
#'    function.
#'
#' @examples
#' data(hw_datafr)
#' number_of_heatwaves(hw_datafr)
#'
#' @export
number_of_heatwaves <- function(hw_datafr){
        out <- nrow(hw_datafr)
        return(out)
}

#' Calculate total heat wave days
#'
#' This function takes a dataframe of heat waves, as created by
#' \code{\link{gen_hw_set}}, and calculates the total number of heat wave days in
#' the dataframe (sum of the number of days in each heat wave for all heat waves
#' in the dataset).
#'
#' @param hw_datafr A dataframe of heat waves and their characteristics, as
#'    created by \code{\link{gen_hw_set}}
#'
#' @return A numeric value with the number of heat wave days in a dataframe
#'    of heat waves, as generated by \code{\link{gen_hw_set}}.
#'
#' @note This function is an example of a function that can be created and
#'    used to explore heat waves using the \code{\link{apply_all_models}}
#'    function.
#'
#' @examples
#' data(hw_datafr)
#' heatwave_days(hw_datafr)
#'
#' @export
heatwave_days <- function(hw_datafr){
        out <- sum(hw_datafr$length)
        return(out)
}

#' Calculate average length of heat waves
#'
#' This function takes a dataframe of heat waves, as created by
#' \code{\link{gen_hw_set}}, and calculates the average length (in days) of
#' heat waves in the dataframe.
#'
#' @param hw_datafr A dataframe of heat waves and their characteristics, as
#'    created by \code{\link{gen_hw_set}}
#'
#' @return A numeric value with the average length of heat waves in a
#'    dataframe of heat waves, as generated by \code{\link{gen_hw_set}}.
#'
#' @note This function is an example of a function that can be created and
#'    used to explore heat waves using the \code{\link{apply_all_models}}
#'    function.
#'
#' @examples
#' data(hw_datafr)
#' average_length(hw_datafr)
#'
#' @export
average_length <- function(hw_datafr){
        out <- mean(hw_datafr$length)
        return(out)
}

#' Calculate average temperature of heat waves
#'
#' This function takes a dataframe of heat waves, as created by
#' \code{\link{gen_hw_set}}, and calculates the average of the daily
#' temperature during each heat wave across all heat waves in the dataframe.
#'
#' @param hw_datafr A dataframe of heat waves and their characteristics, as
#'    created by \code{\link{gen_hw_set}}
#'
#' @return A numeric value with the average temperature (degrees Fahrenheit)
#'    during all heat waves for a dataset of heat waves, as generated by
#'    \code{\link{gen_hw_set}}. This value is the mean of the average
#'    temperature of each heat wave, not the average temperature across all
#'    heat wave days (to calculate that, you would need to calculate a weighted
#'    mean, weighted by the number of days in each heat wave).
#'
#' @note This function is an example of a function that can be created and
#'    used to explore heat waves using the \code{\link{apply_all_models}}
#'    function.
#'
#' @examples
#' data(hw_datafr)
#' average_mean_temp(hw_datafr)
#'
#' @export
average_mean_temp <- function(hw_datafr){
        out <- mean(hw_datafr$mean.temp)
        return(out)
}
