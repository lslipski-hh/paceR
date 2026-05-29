
# paceR

The goal of paceR is to provide useful functions for performing
analytics at Habitat Health while also standardizing conceptual
definitions into functions that can be used across the analytics team.

## Installation

You should install paceR with the `remotes::install_git()` function as
below:

``` r
# install.packages('remotes')
remotes::install_git('https://github.com/lslipski-hh/paceR.git')
```

## Examples

### Creating a Connection

You can assign a JDBC connection to databricks to an r variable in order
to pass it to functions like the below code. You can also pass the
function itself as a parameter to other functions when convenient.

``` r
library('paceR')
my_connection = paceR::databricks_connect()
```

### Executing Custom SQL

You can provide custom sql strings to the `run_sql_string()` function to
execute it against the databricks database and return it as a tibble in
RStudio.

``` r
library('paceR')
paceR::run_sql_string("SELECT *
                       FROM luke.very_important_table;")
```

### Getting Standard Definitions

You can use `get_` functions to return standard definitions that are
agreed upon by the Data Team. For example, running the function below
will return the census data from the Sacramento location only.

``` r
library('paceR')
paceR::get_census('sac')
```
