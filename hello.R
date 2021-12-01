Hello

$ git clone https://github.com/username/repo.git
Username: namenotfoune404Hk
Password: 010128Hk
devtools::install_github("DataScienceProjectsJapan/TidyverseTutorials")
force = TRUE
ggplot(data = mpg)
?mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy)) +
  facet_wrap(~ year)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy)) +
  facet_wrap(~ cty)
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(. ~ cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid( . ~ cty)
