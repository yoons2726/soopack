#' @title pre-process World Bank data
#' @description
#' a function that turns data frame from wide to long format and contain variables - iso, year, data
#' @param data data with wide frame
#' @param value_name change name of value stored
#' @author Soohyun Yoon
#' @import dplyr
#' @examples clean_data(maternal_mortality, "maternal_mortality")
#' @export
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr mutate select


clean_data <- function(data, value_name) {
    data %>%
    tidyr::pivot_longer(
      cols = starts_with("X"),
      names_to = "year",
      values_to = value_name,
      names_prefix = "X"
    ) %>%
    dplyr::mutate(
      year = as.numeric(year)
    ) %>%
    dplyr::select("iso", "year", all_of(value_name))
}
