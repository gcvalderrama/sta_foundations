

install.packages("plotly")
library(plotly)


# experimento completamente al azar 


x <- seq(1, 100, length=100)

fd <- dgeom(x = x,  prob = 0.2)

plot_ly(x = x , y = fd, type = 'scatter', mode='lines', fill = 'tozeroy')



fp <- pgeom(x ,  prob = 0.5 )
plot_ly(x = x , y = fp, type = 'scatter', mode='lines', fill = 'tozeroy')

# cada semana una persona participa en un juego de loteria en donde la prob de ganar es p = 10 -6  Cuantas semenas promedio debe participar 
# hasta ganar la loteria



