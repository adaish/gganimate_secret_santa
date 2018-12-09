## TEST EXAMPLES TO CHECK YOUR PACKAGES 

# Installs for tests
devtools::install_github("dgrtwo/gganimate")
install.packages("gapminder")
library(gapminder)
library(ggplot2)
install.packages("ggthemes")
library(ggthemes)
library(gganimate)

# -------Working ------ Scatter plot gapminder
# From here https://www.ggplot2-exts.org/gganimate.html
theme_set(theme_bw())
  p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop,
                             color = continent)) +
                            geom_point() +
                            scale_x_log10() + 
                            transition_states(
                              year,
                              transition_length = 2,
                              state_length = 1
                            ) +
                            enter_fade() + 
                            exit_shrink() 

#----------WORKING ------- Boxplot
# From here https://github.com/thomasp85/gganimate 
library(ggplot2)
library(gganimate)

ggplot(mtcars, aes(factor(cyl), mpg)) + 
        geom_boxplot() + 
        # Here comes the gganimate code
        transition_states(
          gear,
          transition_length = 2,
          state_length = 1
        ) +
        enter_fade() + 
        exit_shrink() +
        ease_aes('sine-in-out')