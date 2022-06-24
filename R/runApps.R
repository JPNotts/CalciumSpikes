
#' Applications for Simulating Spikes
#'
#' Using run_app() opens either the 'ViewData' or 'SimulatingSpikes' applications.
#'
#' @section 'ViewData':
#' An app that allows raw time-series calcium concentration data to be thresholded to obtain spike sequences.
#'
#' @section 'SimulatingSpikes':
#' An app that allows the user to select an ISI distribution and simulate spike sequences from it.
#' The application only allows for the implementation of 5 ISI types, namely: Exponential, Gamma, Inverse Gaussian, Log Normal and Weibull. To use alternatively distributions/parameterisations please use or \code{\link{simulate_spikes}}.
#'
#'@param app The type of application you want to open. The options are 'SimulatingSpikes' or 'ViewData'
#'
#' @export
#'
#' @examples
#' \dontrun{
#' run_app('ViewData')
#' run_app('SimulatingSpikes')
#' }
run_app <- function(app) {
  if(app =='SimulateSpikes'){
    appDir <- base::system.file("shiny-examples", "SimulateSpikes", package = "SimSpikes")
  }
  else if(app == 'ViewData') {
    appDir <- base::system.file("shiny-examples", "ViewData", package = "SimSpikes")
  }
  else {
    stop("Could not find App. Valid options are 'SimulateSpikes' and 'ViewData'.")
  }

  shiny::runApp(appDir, display.mode = "normal")
}

