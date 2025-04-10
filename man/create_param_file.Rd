% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/param_file.R
\encoding{UTF-8}
\name{create_param_file}
\alias{create_param_file}
\title{Create parameter file for the 'JWSACruncher'}
\usage{
create_param_file(
  dir_file_param,
  bundle = 10000,
  csv_layout = "list",
  csv_separator = ";",
  ndecs = 6,
  full_series_name = TRUE,
  short_column_headers = TRUE,
  rslt_name_level = 2,
  policy = "parameters",
  refreshall = TRUE,
  output = NULL,
  matrix_item = getOption("default_matrix_item"),
  tsmatrix_series = getOption("default_tsmatrix_series"),
  paths_path = NULL,
  v3 = getOption("is_cruncher_v3"),
  file_param = file.path(dir_file_param, "parameters.param")
)
}
\arguments{
\item{dir_file_param}{Path to the directory that will contains the parameter file \code{"parameters.param"} (if \code{file_param} not supplied).}

\item{bundle}{Maximum size for a group of series (in output). By default \code{bundle = 10000}.}

\item{csv_layout}{Layout of the CSV files (series only). By default \code{csv_layout = "list"}. Other options: \code{csv_layout = "vtable"} (vertical table) or \code{csv_layout = "htable"} (horizontal table).}

\item{csv_separator}{The field separator string used in the CSV file. By default \code{csv_separator = ";"}.}

\item{ndecs}{Number of decimals used in the output. By default \code{ndec = 6}.}

\item{full_series_name}{Boolean indicating if the fully qualified name of the series will be used (the default \code{full_series_name = TRUE}) or if only the name of the series  should be displayed.
Only used when \code{v3 = TRUE}.}

\item{short_column_headers}{Boolean indicating if the full column names should be printed (the default \code{short_column_headers = TRUE}) instead of always outputting shortened ones.
Only used when \code{v3 = TRUE} (since v.3.4.0).}

\item{rslt_name_level}{Only used when \code{v3 = TRUE}.}

\item{policy}{Refreshing policy of the processing. By default \code{policy = "parameters"} (re-estimation of the coefficients of the reg-ARIMA model, see details).}

\item{refreshall}{Boolean indicating if the data is refreshed (by default \code{refreshall = TRUE}).}

\item{output}{Full path of the output folder. By default (\code{output = NULL}) a folder is create in the path to the workspace ([workspace]/Output).}

\item{matrix_item}{Character containing the items of the matrix output (see the 'JDemetra+' manual for more information). By default, the items defined in the option \code{getOption("default_matrix_item")} are used (option initialized by the default output of the 'JWSACruncher' 2.2.2).}

\item{tsmatrix_series}{Character containing the names of the times series to export (see the 'JDemetra+' manual for more information).  By default, the items defined in the option \code{getOption("default_tsmatrix_series")} are used (option initialized by the default output of the 'JWSACruncher' 2.2.2).}

\item{paths_path}{The paths used for relative addresses (see the "Demetra Paths" of the graphical interface of 'JDemetra+').}

\item{v3}{Boolean indicating if the parameter file should be compatible with a version 3.0.0 and higher of 'JWSACRuncher' (\code{v3 = TRUE}) or a lower version (\code{v3 = FALSE}). By default
the value of the option \code{"is_cruncher_v3"} is used (equals to \code{FALSE} by default).}

\item{file_param}{Path to the parameters file.
By default the file is named \code{parameters.param} and it is created at the \code{fir_file_param} directory.}
}
\value{
Path to the parameter file.
}
\description{
To run the 'JWSACruncher' needs a parameter file and \code{create_param_file} allows to create it.
}
\details{
When the 'JWSACruncher' is launched, the data is refreshed with a specific policy that is defined by the parameter \code{policy}. The available options are:
\itemize{
\item \code{policy = "current"}: all the estimations are fixed and AO added for new data (since v.2.2.3), short name \code{policy = "n"};
\item \code{policy = "fixed"}: all the estimations are fixed (since v.2.2.3), short name \code{policy = "f"};
\item \code{policy = "fixedparameters"}: re-estimation of the coefficients of the regression variables (but not the ARIMA coefficients), short name \code{policy = "fp"};
\item \code{policy = "fixedarparameters"}: re-estimation of the coefficients of the regression variables and of the MA coefficients of the ARIMA model (but not the AR coefficients), short name \code{policy = "farp"} (since v.3.4.0);
\item \code{policy = "parameters"} (the default): \code{policy = "fixedparameters"} + re-estimation of ARIMA coefficients, short name \code{policy = "p"};
\item \code{policy = "lastoutliers"}: \code{policy = "parameters"} + re-identification of last outliers (on the last year), short name \code{policy = "l"};
\item \code{policy = "outliers"}: \code{policy = "lastoutliers"} + re-identification of all outliers, short name \code{policy = "o"};
\item \code{policy = "stochastic"}: \code{policy = "outliers"} + re-identification of ARIMA orders, short name \code{policy = "s"};
\item \code{policy = "complete"} or \code{policy = "concurrent"}: the model is completely re-identified and re-estimated, short name \code{policy = "c"}.
}
}
\examples{
\dontrun{
dir = tempdir()
# Here a file parameters.param is created in the directory dir
# with default parameters of the different options
create_param_file(dir)
# to only export the raw and the seasonally adjusted series
 create_param_file(dir, 
                   tsmatrix_series = c("y", "sa"))
}

}
\seealso{
\code{\link[=read_param_file]{read_param_file()}}, \code{\link[=list2param_file]{list2param_file()}}, \link{default_param_file} \code{\link[=cruncher_and_param]{cruncher_and_param()}}.
}
