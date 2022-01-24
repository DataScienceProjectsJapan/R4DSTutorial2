ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth( )
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(se = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(stroke = 5) + 
  geom_smooth(size=3, se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group = drv)) + 
  geom_point(stroke = 4) + 
  geom_smooth(size=2,se=FALSE)
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(group = drv), size=3,se = FALSE) +
  geom_point (stroke = 4)
	ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes( colour = drv), stroke = 4) +
  geom_smooth(size = 3, se = FALSE)
	
	ggplot() + 
	  geom_point(data = mpg, mapping = aes(x = displ, y = hwy, color = drv),stroke = 3) + 
	  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy), size=3,se=FALSE, show.legend = FALSE)
	ggplot(mpg, aes(x = displ, y = hwy)) +
	  geom_point(size =3, color = "white") +
	  geom_point(aes(colour = drv), strock=4)

	ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
	  geom_point(mapping = aes(color = class)) + 
	  geom_smooth(se = FALSE)
	