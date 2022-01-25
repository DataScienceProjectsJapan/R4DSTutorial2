library(tidyverse)
view(mpg)
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y=hwy)) +
  facet_grid(drv~cyl)
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y = cty, color = cyl))
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y = cty, size = cyl))
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y = cty, shape = cyl))
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y = cty, color = displ))
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y = cty, color = cyl < 5))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 1)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ class)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cty, as.table = FALSE)
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y=hwy)) +
  facet_wrap(~class, nrow = 2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~cyl, margins = TRUE)



