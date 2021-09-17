?geom_point
vignette("ggplot2-specs")
colors()

library(tidyverse)

mpg
head(mpg)
tail(mpg)
glimpse(mpg)
str(mpg)
summary(mpg)

# https://stackoverflow.com/questions/24536154/what-does-mean-in-r
# Shift + Left Mouse
"Hello world!" %>% print()
iris %>% head()
iris %>% summary()
iris %>% head() %>% summary()
# this is equivalent to summary(head(iris))

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

# NOTE: '+' comes at end of line

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# Warning messages:
# 1: The shape palette can deal with a maximum of 6 discrete values because
# more than 6 becomes difficult to discriminate; you have 7. Consider
# specifying shapes manually if you must have them. 
# 2: Removed 62 rows containing missing values (geom_point).

# Correct usage
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Incorrect usage
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

# Continuous variables use a color scale
ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) +
  geom_point()

# Mapping same variables to multiple aesthetics [POINTLESS]
ggplot(mpg, aes(x = displ, y = hwy, colour = hwy, size = displ)) +
  geom_point()

?facet_wrap
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

# Faceting a continuous variable
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(. ~ cty)

ggplot(data = mpg)  
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# Original - but Repetitive
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv))

# Better
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() +
  geom_smooth(mapping = aes(linetype = drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

# NOTE: 'color' creates implicit groups.
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()

?geom_smooth

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(se = FALSE)
# 'se' controls display of confidence interval of standard error

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

?Geom

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(shape = 21, colour = "white", size = 2, stroke = 2, 
             mapping = aes(fill = drv))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(size = 4, color = "white") +
  geom_point(aes(colour = drv))
# Added two layers of 'geom_point' instead of specifying 'stroke'

ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)

# Bar Chart
# Count of X plotted on Y
# stat = "count" for geom_bar

?geom_bar
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

# NOTE: Every 'geom' has a default 'stat', and every 'stat' has a default 'geom'

# Explicitly changing 'stat' of 'geom_bar' to "identity"
?tribble # Row-wise tibble creation
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551)
ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")

ggplot(mpg, aes(x = class, y = drv)) +
  geom_point()

count(mpg, drv, class)

# Better way of plotting two categorical variables
ggplot(mpg, aes(x = class, y = drv)) +
  geom_count()

?geom_tile
mpg %>%
  count(class, drv) %>%
  ggplot(aes(x = class, y = drv)) +
  geom_tile(mapping = aes(fill = n))
?geom_count
# here 'n' is a computed variable storing number of observations at position.

trees %>%
  select(Height, Volume) %>%
  filter(Height > 80) %>%
  summary()

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
?group # Aesthetics:grouping
# 'prop' is a computed variable storing percent of points in that panel
                                                          # at that position

# If group = 1 is not included, then all the bars in the plot will have the 
# same height, a height of 1. The function geom_bar() assumes that the groups
# are equal to the x values since the stat computes the counts within the group.
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = after_stat(prop)))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))

# '..prop..' became 'after_stat(prop)'
?after_stat

# stat <-- statistical transformation

# Default 'stat' for 'stat_summary' is "summary"
?stat_summary
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary"
  )
#> No summary function supplied, defaulting to `mean_se()`

# Default 'stat' for 'geom_pointrange' is "identity"
ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",
    fun.min = min,
    fun.max = max,
    fun = median
  )

# The arguments 'fun.ymin', 'fun.ymax', and 'fun.y' have been deprecated and 
              # replaced with fun.min, fun.max, and fun in ggplot2 v 3.3.0.

?complete
?list
mpg %>%
  count(class, drv) %>%
  complete(class, drv, fill = list(n = 0)) %>%
  ggplot(aes(x = class, y = drv)) +
  geom_tile(mapping = aes(fill = n))

# line chart: geom_line()
# boxplot: geom_boxplot()
# histogram: geom_histogram()
# area chart: geom_area()

# 'geom_col' uses 'stat_identity'
# https://jrnold.github.io/r4ds-exercise-solutions/data-visualisation.html#exercise-3.7.3

?stat_smooth # Check arguments and computed variables

