?geom_point
vignette("ggplot2-specs")
colors()

library(tidyverse)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

# ggplot(data = <DATA>) + <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point()

# Add aesthetic mappings
p + geom_point(aes(colour = factor(cyl)))

p + geom_point(aes(shape = factor(cyl)))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
# Warning message:
# Using alpha for a discrete variable is not advised.

# NOTE: '+' comes at end of line.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# Warning messages:
# 1: The shape palette can deal with a maximum of 6 discrete values because
# more than 6 becomes difficult to discriminate; you have 7. Consider
# specifying shapes manually if you must have them. 
# 2: Removed 62 rows containing missing values (geom_point).

# Correct usage.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Incorrect usage.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

?facet_wrap

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# Original - but Repetitive
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv))

# Better
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(mapping = aes(linetype = drv, color = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = TRUE
  )

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

?geom_smooth

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(se = FALSE)

# geom_smooth added for sub-compact cars alone - filter()
# Local geom_smooth data overrides global data
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE, 
              aes(color = class))

# Method changed to 'lm' from NULL [DEFAULT]
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = lm)

?loess
?lm
?glm
?gam

# https://ggplot2.tidyverse.org/reference/geom_smooth.html
# Shift + Left Mouse

?Geom

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(shape = 21, colour = "white", size = 5, stroke = 3, 
             mapping = aes(fill = drv))

# Bar Chart
# Count of X plotted on Y
# stat = "count" for geom_bar
?geom_bar

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

