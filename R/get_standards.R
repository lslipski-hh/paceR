#' get_census
#'
#' @description
#' This function takes a Habitat Health location and pulls the entire census table
#' for that location. If `location = 'all'` is specified, all locations will be pulled
#' and appended to one another.
#'
#'
#' @param location a string, one of 'all' (default), 'sac' for sacramento, or 'sla' for south LA
#'
#'
#' @returns tibble of census data depending on location choice
#' @export
#'
#' @examples
#' \dontrun{
#' # get the census table data from the Sacramento location
#' get_census('sac')}
get_census <- function(location = "all") {
  if(location == "all") {
    dplyr::bind_rows(run_sql_string(sql_string = "SELECT * FROM staging.de_core.stg_census_sac"),
                     run_sql_string(sql_string = "SELECT * FROM staging.de_core.stg_census_sla"))
  }
  else if(location == "sac") {
    run_sql_string(sql_string = "SELECT * FROM staging.de_core.stg_census_sac")}
  else if(location == "sla") {
    run_sql_string(sql_string = "SELECT * FROM staging.de_core.stg_census_sla")
  }
  else stop("location parameter must be one of 'all' (default), 'sac', or 'sla'")
}
