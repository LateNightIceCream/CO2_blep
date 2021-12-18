library(ggplot2)

args = commandArgs(trailingOnly=TRUE)
infile <- args[1]

width   <- 10
height  <- 0.618 * width
outname <- 'output.pdf'

data <- read.csv(infile)
data <- data.frame(idx = as.numeric(row.names(data)), co2e = data$co2e_ppm, tvoc = data$tvoc_ppb)

p <- ggplot(data = data, aes(x = idx, y = tvoc)) +
  theme_minimal() +
  geom_line(color = 'blue')

pdf(outname, width, height)
p
