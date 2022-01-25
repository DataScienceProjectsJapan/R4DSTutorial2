ggplot(data = mpg) +
  geom_line(mapping =aes(x = displ, y = hwy))
ggplot(data = mpg) +
  geom_boxplot(mapping =aes(x = displ, y = hwy, group = cty))
ggplot(data = mpg) +
  geom_histogram(mapping =aes(x = displ))
ggplot(data = mpg) +
  geom_area(mapping =aes(x = displ, y = cty))
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +      
  geom_point() + 
  geom_smooth(se = TRUE)
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, colour = drv),
              show.legend = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(mapping = aes(group = drv), se = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(se = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv), show.legend = FALSE) +
  geom_smooth(mapping = aes(linetype = drv), se = FALSE, show.legend = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(size = 5, color = "white")
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(color = drv, se = FALSE))
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(color = drv), se = FALSE)
ggplot(data = mpg, mapping = aes(x = hwy, y = cty)) +
  geom_point() +
  geom_smooth() +
  geom_smooth(inherit.aes = FALSE, mapping = aes(x = hwy, y = displ))