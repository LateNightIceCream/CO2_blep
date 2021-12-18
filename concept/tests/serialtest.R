library(serial)

con <- serialConnection(name = "testcon", port="ttyUSB0", mode = "115200,n,8,1", newline = 0, translation = "crlf")

open(con)

while (TRUE) {
  if (nBytesInQueue(con)) {
    x <- read.serialConnection(con)
    print(x)
  }
}
