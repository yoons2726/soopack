#' @title pre-process World Bank data
#' @description
#' a function that turns data frame from wide to long format and contain variables - iso, year, data
#' @param data data with wide frame
#' @param value_name change name of value stored
#' @author Soohyun Yoon
#' @import dplyr
#' @examples
#' clean_data(maternal_mortality, "maternal_mortality")
#' @export

library(dplyr)
clean_data <- function(data, value_name) {
    data %>%
    pivot_longer(
      cols = starts_with("X"),
      names_to = "year",
      values_to = value_name,
      names_prefix = "X"
    ) %>%
    mutate(
      year = as.numeric(year)
    ) %>%
    select("iso", "year", value_name)
}
