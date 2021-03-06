########################################################################
## R SECRET SANTA 
## December 2018
## Dear "R" user
## From Secret "R" Santa
########################################################################

## Packages required
install.packages("tweenr")
install.packages("animation")
install.packages("magick")
install.packages("devtools")
install.packages("readr")
install.packages("ggthemes")
library(devtools)
devtools::install_github("dgrtwo/gganimate")

library(tweenr)
library(ggplot2)
library(gganimate)
library(animation)
library(magick)
library(ggthemes)

#######################################################################
#------Tree outline -----------------Quick Render-----------------------------------------
# Load data points from extracting them for a tree outline 
# using  http://arohatgi.info/WebPlotDigitizer/

points <- read.csv( "data/tree_outline.csv")

# Create scramble of points to hide image 

scramble_points <- points

scramble_points$V1 <- scramble_points$V1[ sample( 1 : nrow( scramble_points ),
                                          nrow( scramble_points ),
                                          replace = F ) ]

# Create data list going from random to the image/message to random again

transition_stages <- list(scramble_points, points, scramble_points)

message <- tweenr::tween_states(transition_stages,
                                tweenlength = 1,
                                statelength = 0.5,
                                ease = "sine-out", 
                                nframe = 50) 

p <- ggplot(message, aes( x = V1, y = V2 )) + 
            geom_point(colour="dark green") + 
            transition_states(
                              .frame,
                              transition_length = 2,
                              state_length = 1) +
            enter_fade() + 
            exit_shrink() + 
            theme_void() # Remove grid 

animation::ani.options( interval = 1 / 15 )
magick::image_write(animate(p), path="GIF_output/christmas_tree_outline.gif")

#------Happy Christmas message-------Longer to render--------------------------------------------------------
# Load data points from extracting them for a tree outline 
# using  http://arohatgi.info/WebPlotDigitizer/

points <- read.csv( "data/message.csv", header = F )

# Create scramble of points to hide image 

scramble_points <- points

scramble_points$V1 <- scramble_points$V1[ sample( 1 : nrow( scramble_points ),
                                                  nrow( scramble_points ),
                                                  replace = F ) ]

# Create data list going from random to the image/message to random again

transition_stages <- list(scramble_points, points, scramble_points)

message <- tweenr::tween_states(transition_stages,
                                tweenlength = 1,
                                statelength = 0.5,
                                ease = "sine-out", 
                                nframe = 50) 

p <- ggplot(message, aes( x = V1, y = V2 )) + 
            geom_point(colour="red3") + 
            transition_states(
                            .frame,
                            transition_length = 2,
                            state_length = 1) +
            enter_fade() + 
            exit_shrink() + 
            theme_void() # Remove grid 

animation::ani.options( interval = 1 / 15 )
magick::image_write(animate(p), path="GIF_output/happy_christmas_message.gif")

#------Christmas Tree----------------Longer to render------------------------------------------------
# Load data points from extracting them for a tree outline 
# using  http://arohatgi.info/WebPlotDigitizer/

points <- read.csv( "data/tree.csv", header = F )

# Create scramble of points to hide image 

scramble_points <- points

scramble_points$V1 <- scramble_points$V1[ sample( 1 : nrow( scramble_points ),
                                                  nrow( scramble_points ),
                                                  replace = F ) ]

# Create data list going from random to the image/message to random again

transition_stages <- list(scramble_points, points, scramble_points)

message <- tweenr::tween_states(transition_stages,
                                tweenlength = 1,
                                statelength = 0.5,
                                ease = "sine-out", 
                                nframe = 50) 

p <- ggplot(message, aes( x = V1, y = V2 )) + 
      geom_point(colour="green4") + 
      transition_states(
                        .frame,
                        transition_length = 2,
                        state_length = 1) +
      enter_fade() + 
      exit_shrink() + 
      theme_void() # Remove grid 

animation::ani.options( interval = 1 / 15 )
magick::image_write(animate(p), path="GIF_output/christmas_tree.gif")




#######################################################################
# Appendix ---------------------------------------------------
# Modified code from http://edinbr.org/edinbr/2017/11/18/pre-december-Merry-Christmas-message.html
# This code didn't work run for me but inspired me to fix to give gganimate a try. :)


