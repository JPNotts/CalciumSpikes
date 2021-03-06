% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GaussianProcess.R
\name{mcmc_gp}
\alias{mcmc_gp}
\title{Model fitting when the intensity function is assumed to have a GP prior.}
\usage{
mcmc_gp(
  d.spikes,
  end.time,
  iter,
  burn,
  steps,
  w,
  prior.x = c(1000, 1e-05),
  hyper.param = c(1, 0.001),
  ISI.type = "Gamma",
  sigma.h = NA,
  start.hyper = 1000,
  hyper.start = 1,
  l.param = 1,
  start.l = 1000,
  sigma.l = NA,
  initial.l = 1,
  T.min.param = NA,
  sigma.t = NA,
  x.start = NULL
)
}
\arguments{
\item{d.spikes}{The calcium spike sequences used to fit the model (a data frame where each column consists of a single spike sequence).}

\item{end.time}{The length of the experiment}

\item{iter}{The number of iterations of the MCMC after the initial burn in.}

\item{burn}{The initial number of iterations to remove.}

\item{steps}{The number of steps to partition the intensity function into.}

\item{w}{The under relaxed parameter takes values between -1 and 1.}

\item{prior.x}{The pair (sigma^2_f, 'sigma_n^2 ) of the signal variance and noise variance.}

\item{hyper.param}{Either the fixed value of the ISI parameter or the parameters of the Gamma prior for the ISI parameter.}

\item{ISI.type}{The inhomogeneous ISI distribution. Either 'Exponential', 'Gamma', 'InverseGaussian', 'LogNormal' or 'Weibull'.}

\item{sigma.h}{RW-metropolis variance for the ISI parameter.}

\item{start.hyper}{The iteration to begin inferring the ISI parameter.}

\item{hyper.start}{initial value of the ISI parameter.}

\item{l.param}{Either the fixed value of the length scale or the parameters of the Gamma prior for the length scale.}

\item{start.l}{The iteration to begin inferring the length scale.}

\item{sigma.l}{RW-metropolis variance for the length scale of the Gaussian Process.}

\item{initial.l}{Initial value of the length scale of the Gaussian Process.}

\item{T.min.param}{Either the fixed value of the refractory period or the parameters of the Gamma prior for the refractory period. If we do not want to include the refractory period set to NA.}

\item{sigma.t}{RW-metropolis variance for the refractory period.}

\item{x.start}{The inital value for the intensity function.}
}
\value{
\code{iter} samples of the posterior distribution
}
\description{
This function runs an MCMC algorithm to sample from the posterior ISI distribution given calcium spike sequences, where we assume the intensity function has a Gaussian Process prior.
}
\examples{
\dontrun{
spikes <- sort(runif(20, min=0,max=20))
posterior = mcmc_gp(data.frame(spikes), end.time=20, iter = 10000, burn = 5000,
 ISI.type='Gamma', steps = 1000, w=0.0001, sigma.h = 1, l.param = 3.6)
}
}
