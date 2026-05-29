#' run_sql_string
#'
#' @description
#' This function takes a database connection (default is `paceR::databricks_connect()`)
#' and a `sql_string` containing sql to be executed. It returns the result as a tibble.
#'
#'
#' @param sql_string a string containing sql code to be executed
#' @param con a connection object
#'
#' @returns tibble
#' @export
#'
#' @examples
#' \dontrun{
#' run_sql_string(sql_string = 'SELECT * FROM curated.all.census;')}
run_sql_string <- function(sql_string,
                           con = databricks_connect()) {
  # Format with glue_sql
  glue::glue(.con = con,
             sql_string) %>%
    # Run the query
    DBI::dbGetQuery(conn = con) %>%
    # Return as a tibble
    dplyr::as_tibble()
}
