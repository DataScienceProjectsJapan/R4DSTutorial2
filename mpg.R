library(tidyverse)
plot(mpg$displ,mpg$cty)
view(mpg)
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y = cty, color = class, size =cyl))
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y = cty, color = cyl < 5))
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y=hwy)) +
  facet_wrap(~class,nrow=2)
ggplot(data = mpg) +
  geom_point(mapping =aes(x = displ, y=hwy)) +
  facet_grid(drv~cyl)