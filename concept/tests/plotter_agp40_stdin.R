library(ggplot2)
library(patchwork)

width   <- 10
height  <- 0.618 * width
outname <- 'agp40.pdf'

args = commandArgs(trailingOnly=TRUE)
infile <- 'stdin'

data <- read.csv(infile)
data <- data.frame(t_sec = data$t_sec, voc_index = data$voc_index, voc_index_default = data$voc_index_default, temp = data$temp, hum = data$hum)

data$t_sec <- cumsum(c(0, diff(data$t_sec)))
# temperature as fraction of 25 deg C
data$temp <- data$temp / 25 * 100


p <- ggplot(data = data, aes(x = t_sec, y = voc_index)) +
  theme_minimal() +
  geom_line(color = 'blue') +
  geom_line(aes(x = t_sec, y = voc_index_default), color = 'red')

p2 <- ggplot(data = data, aes(x = t_sec, y = temp)) +
  theme_minimal() +
  geom_line(color = 'cyan') +
  geom_line(aes(x = t_sec, y = hum), color = 'green')

pdf(outname, width, height)
p + p2
