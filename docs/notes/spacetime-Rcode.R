################################################# PART 1 ##################################################

### DATA


## loading package and data 
library(PtProcess)
data(package="PtProcess")

## viewing one of the datasets
data(Ogata)
Ogata
?Ogata

## plotting
plot(Ogata$time, rep(0,length(Ogata$time)),xlim=c(0,800),ylab="",xlab="Times")
plot(Ogata$time, Ogata$magnitude+3.5, type="h",xlim=c(0, 800),ylim=c(0,6.5),xlab="Time", ylab="Magnitude")


### SPECIFYING CONDITIONAL INTENSITY


## time interval
TT = c(0, 800)

## we will use the ETAS model with ground intensity
##    lambda*(t) = mu + A sum{exp[alpha(mi - m0)](1 + (t-ti)/c)^(-p)}
## and an exponential mark distribution
##    f*(m|t) = b exp(-b*(m-m0))

## choosing parameters - we'll estimate them properly a little later
mu = 0.007           # intensity of main shocks
A = 2.3              # scaling for number of aftershocks
alpha = 0.98         # scaling for number of aftershocks depending on shock size
c = 0.008; p = 0.94  # parameters for shape of aftershock intensity
b = 2.3                # b*log(10) is inverse mean of magnitude
params = c(mu, A, alpha, c, p, b)

## defining model
x = mpp(data=Ogata,gif=etas_gif,marks=list(dexp_mark, rexp_mark),params=params,
  gmap=expression(params[1:5]),mmap=expression(params[6]),TT=TT)
class(x)  # x is now a mpp (marked point process) object
names(x)  # ... and it contains both data and model specification

## plotting intensity
plot(x, log=F, xlab="")
plot(x, log=T, xlab="")  # log scale

## examples of intensity functions in PtProcess
etas_gif   # ETAS model used above
?etas_gif  # the function can be used both to evaluate the cif and the integrated cif
?srm_gif    # stress-release model lambda*(t) = exp{a + b[t - cS(t)]}
           # where S(t) = sum{10^[0.75(M_i-M_0)]}
?simple_gif # Poisson process lambda*(t) = a + b t^g
# other functions are available and the user can make his/her own functions, check ?gif


################################################## PART 2 ##############################################


### ESTIMATION


## log likelihood
logLik(x)  # a single value, for both fixed data and parameters

## function for entering new parameters into old model - check help page for negLogLik for other possibilities
allmap <- function(y, params){
    #    one to one mapping
    y$params = params
    return(y)
}

## Newton-Raphson type algorithm, minimizing negative log likelihood 
z = nlm(neglogLik, params, object=x, pmap=allmap,
         print.level=1, iterlim=500, typsize=abs(params))
## some NaNs produced - probably some parameters have been negative at some point
z$estimate  # MLE
x = allmap(x, z$estimate)  # inserting MLE into x

## log likelihoods and plots
logLik(x)  # much higher likelihood now, hopefully close to max
plot(x, log=TRUE)  # log intensity with estimated parameters


####################################################### PART 3 ##################################################


### SIMULATION - only Ogata's modified thinning algorithm is implemented

## simulating with the estimated parameters
xsim = simulate(x)  # same object, but now with simulated data
xsim$data
plot(xsim$data$time, rep(0,length(xsim$data$time)),xlim=c(0,800),ylab="",xlab="Time")
plot(xsim$data$time, xsim$data$magnitude+3.5, type="h",xlim=c(0, 800),ylim=c(0,6.5),xlab="Time", ylab="Magnitude")

### comparing with data as a crude model check
par(mfrow=c(2,2))
plot(x$data$time, rep(0,length(x$data$time)),xlim=c(0,800),ylab="",xlab="Time")
plot(x$data$time, x$data$magnitude+3.5, type="h",xlim=c(0, 800),ylim=c(0,6.5),xlab="Time", ylab="Magnitude")
plot(xsim$data$time, rep(0,length(xsim$data$time)),xlim=c(0,800),ylab="",xlab="Time")
plot(xsim$data$time, xsim$data$magnitude+3.5, type="h",xlim=c(0, 800),ylim=c(0,6.5),xlab="Time", ylab="Magnitude")
par(mfrow=c(1,1))
## hard to see visually


##################################################### PART 4 ####################################################

### MODEL CHECKING: RESIDUALS


## calculating residuals and plotting
r = residuals(x)
tau = r[-1]-r[-length(r)]  # interevent in the residual process

## histogram and QQ-plot to check exponential distribution
hist(tau,prob=TRUE,breaks=20)
curve(dexp(x,1),add=TRUE)
p = ppoints(length(tau))   # a regular grid of points
q = qexp(p,1)  # the quantiles
qqplot(q,tau) 
lines(c(0,10),c(0,10))
## both looks okay

## checking for dependence between subsequent interevent times
plot(tau[-1],tau[-length(tau)])  # nothing seems out of the ordinary, but a bit hard to see for exponential variables
plot(pexp(tau[-1]),pexp(tau[-length(tau)]))  # maybe easier to see if we transform to uniform variables - also ok
## hard to check in general for dependence

## The residuals themselves should also resemble a straight line when plotted against event number
plot(r, ylab="Transformed Time", xlab="Event Number")
abline(a=0, b=1, lty=2, col="red")


### Let us try to fit a Poisson process to the dataset

params1 = c(1,1,1,1)  # lambda*(t) = a + b t^g - fourth parameter is for marks, now not related to times
x1 = mpp(data=Ogata,gif=simple_gif,marks=list(dexp_mark, rexp_mark),params=params1,
        gmap=expression(params[1:3]),mmap=expression(params[4]),TT=TT)
z = nlm(neglogLik, params1, object=x1, pmap=NULL,
        print.level=1, iterlim=500, typsize=abs(params1))  ## definitely some problems with numerical minimization
x1$params = z$estimate; x1$params  ## negative parameter a
plot(x1)  # ok, this is positive - also reflects more earthquakes in the beginning

## we check to see if we can see any problem in the model for the modified data
r = residuals(x1)
tau = r[-1]-r[-length(r)]

## histogram and QQ-plot to check exponential distribution
hist(tau,prob=TRUE,breaks=20)
curve(dexp(x,1),add=TRUE)  # too heavy tail for an exponential distribution
p = ppoints(length(tau))
q = qexp(p,1)
qqplot(q,tau)  
lines(c(0,10),c(0,10))  # again, too heavy-tailed

## checking for dependence between subsequent interevent times
plot(tau[-1],tau[-length(tau)])  # hard to see whether there is any dependence with so many points in the lower left corner
## hard to say anything about dependence from this

## The residuals themselves should also resemble a straight line when plotted against event number
plot(r, ylab="Transformed Time",  xlab="Event Number")
abline(a=0, b=1, lty=2, col="red")
## zig-zag-shape - looks like points are too clustered for Poisson

## It seems that a Poisson process is a bad idea for this data