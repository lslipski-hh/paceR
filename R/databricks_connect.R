#' databricks_connect
#'
#' @description
#' This function sets up a connection to Habitat's Databricks database. It requires that you have correctly
#' saved environment variables needed to connect to Databricks and installed the correct JDBC driver and
#' Java software on your computer. For a guide to these installations see the the team's [Analytics in R](https://habitathealth.atlassian.net/wiki/spaces/teamfaa190968e2a4b35963a58c1a4cb3842/pages/161579009/Analytics+in+R)
#' page
#'
#'
#' @returns connection to Habitat's Databricks database
#' @export
#'
#' @examples
#' \dontrun{
#' run_sql_string(con = databricks_connect(),
#'                sql_string = 'SELECT * FROM staging.de_core.stg_census_sac')}
databricks_connect <-  function() {
  RJDBC::dbConnect(drv = RJDBC::JDBC(driverClass = 'com.databricks.client.jdbc.Driver',
                                     classPath = Sys.getenv("DATABRICKS_DRIVER_PATH")),
                   Sys.getenv("DATABRICKS_JDBC"),
                   'token',
                   Sys.getenv("DATABRICKS_TOKEN"))
}
