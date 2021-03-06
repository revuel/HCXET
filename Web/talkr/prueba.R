# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Project: FuzzyPruebas                                                       #
#                                                                             #
# File: funciones.R                                                           #
# Date: 14/06/2015                                                            #
# Author: Miguel Revuelta Espinosa; revuel@github                             #
#                                                                             #
# Notes: Testing package FuzzyToolkitUoN                                      #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# --------------------------------------------------------------------------- #
# Dependencies & library initialitation
# --------------------------------------------------------------------------- #

#install.packages('FuzzyToolkitUoN')
if (!'FuzzyToolkitUoN' %in% installed.packages()){
  install.packages('FuzzyToolkitUoN')
} 

library(FuzzyToolkitUoN)

# --------------------------------------------------------------------------- #
# MAIN
# --------------------------------------------------------------------------- #

# Capture OS input data
# · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · #

# Arguments
args <- commandArgs(TRUE)

# Saving values into local variable
vector <- c(args[1], args[2], args[3], args[4], args[5], args[6], args[7], 
            args[8], args[9], args[10], args[11], args[12], args[13], args[14], 
            args[15])

# Development usage
# vector <- c(2.1000, 1.8333, 1.7667, 1.9000, 2.0333, 1.6667, 2.0667, 1.6333, 
#             2.7333, 1.8667, 1.8000, 2.3000, 1.5667, 2.4000, 1.9667)

# For control purpose only
# fileConn <- file("output.txt")
# writeLines(vector, fileConn)
# close(fileConn)
tryCatch( {
  fileConn <- file("output.txt")
  writeLines(vector, fileConn)
   },
  error = function (cond) {
    
  },
  finally = {
    close(fileConn)
  })

# Statistical plot saving
# · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · #

# Plot of the input values linear function form
tryCatch( {
  png(filename="mf.png", width=500, height=500)
  plot(vector, type="o", col="blue", xlab="Preguntas", ylab="Respuesta media", 
       main="Valores medios de las respuestas a las preguntas basadas 
     en los principios de la CCP")
  dev.off()

  },
  error = function (cond) {
    
  },
  finally = {
    #dev.off()
  })

# Grouped Histogram of the answer values
tryCatch( {
  h <- hist(as.numeric(vector), freq = TRUE, right = TRUE, 
            border = topo.colors(length(as.numeric(vector))))
  png(filename="hg.png", width=500, height=500)
  plot(h, main = "Histogram", xlab="mean of responses", ylab="Frequency")
  dev.off()
   },
  error = function (cond) {
    print(paste("Something went wrong ", cond, sep=""))
  },
  finally = {
    #dev.off()
  })

# Fuzzy Item Structure set up
# · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · #

# FIS instantiation
hcFIS <<- newFIS("hcFIS")

# Add variables
hcFIS <<- addVar(hcFIS, "input", "hc", 1:15)
hcFIS <<- addVar(hcFIS, "input", "hh", 1:15)
hcFIS <<- addVar(hcFIS, "output", "result", 1:15)

# Create and add Input Memebership functions (human centeredness)
notc <<- gaussMF("notc", 1:15, c(2,0,1))
neutralc <<- gaussMF("neutralc", 1:15, c(2,7,1))
yesc <<- gaussMF("yesc", 1:15, c(2,15,1))

hcFIS <<- addMF(hcFIS, "input", 1, notc)
hcFIS <<- addMF(hcFIS, "input", 1, neutralc)
hcFIS <<- addMF(hcFIS, "input", 1, yesc)

noth <<- gaussMF("noth", 1:15, c(3,0,1))

# Create and add Input Memebership functions (human hostile)
noth <<- gaussMF("noth", 1:15, c(1.5,0,1))
neutralh <<- gaussMF("neutralh", 1:15, c(2.5,5,1))
yesh <<- gaussMF("yesh", 1:15, c(4,15,1))

hcFIS <<- addMF(hcFIS, "input", 2, noth)
hcFIS <<- addMF(hcFIS, "input", 2, neutralh)
hcFIS <<- addMF(hcFIS, "input", 2, yesh)

# Add output Fuzzy sets
hostile <<- triMF("hostile", 1:15, c(1,2,4,1))
aversive <<- triMF("aversive", 1:15, c(3,4,6,1))
neutral <<- triMF("neutral", 1:15, c(5,6,9,1))
friendly <<- triMF("friendly", 1:15, c(8,9,12,1))
human.centered <<- triMF("human.centered", 1:15, c(11,14,15,1))

hcFIS <<- addMF(hcFIS, "output", 1, hostile)
hcFIS <<- addMF(hcFIS, "output", 1, aversive)
hcFIS <<- addMF(hcFIS, "output", 1, neutral)
hcFIS <<- addMF(hcFIS, "output", 1, friendly)
hcFIS <<- addMF(hcFIS, "output", 1, human.centered)


# Add rules
hcFIS <<- addRule(hcFIS, c(1,1,3,1,1))
hcFIS <<- addRule(hcFIS, c(1,2,2,1,1))
hcFIS <<- addRule(hcFIS, c(1,3,1,1,1))
hcFIS <<- addRule(hcFIS, c(2,1,4,1,1))
hcFIS <<- addRule(hcFIS, c(2,2,3,1,1))
hcFIS <<- addRule(hcFIS, c(2,3,2,1,1))
hcFIS <<- addRule(hcFIS, c(3,1,5,1,1))
hcFIS <<- addRule(hcFIS, c(3,2,4,1,1))
hcFIS <<- addRule(hcFIS, c(3,3,3,1,1))

# Plot Fuzzy Things
# · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · #

# Input Fuzzy set 1
png(filename="input1.png", width=500, height=500)
plotMF(hcFIS, "input", 1)
dev.off()

# Input Fuzzy set 2
png(filename="input2.png", width=500, height=500)
plotMF(hcFIS, "input", 2)
dev.off()

# Output Fuzzy set 2
png(filename="output.png", width=500, height=500)
plotMF(hcFIS, "output", 1)
dev.off()

# Defuzzyfication?
# · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · · #
tryCatch( {
  r <- evalFIS(as.numeric(vector), hcFIS)
  png(filename="resultado.png", width=500, height=500)
  plot(r)
  dev.off()
   },
  error = function (cond) {
    print(paste("Something went wrong ", cond, sep=""))
  },
  finally = {
    #dev.off()
  })


