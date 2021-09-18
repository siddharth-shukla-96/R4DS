1 / 200 * 30
#> [1] 0.15
(59 + 73 + 2) / 3
#> [1] 44.66667
sin(pi / 2)
#> [1] 1

x <- 3 * 4 # Alt + '-'
# object_name <- value
# Don't use '='

i_use_snake_case <- 0
otherPeopleUseCamelCase <- 0
some.people.use.periods <- 0
And_aFew.People_RENOUNCEconvention <- 0

x #inspecting 'x'
#> [1] 12

this_is_a_really_long_name <- 2.5

# type something partly then press 'Tab' for auto-complete
# type something partly in console and press 'Ctrl + Up' to find matching old
                                                                  # command

r_rocks <- 2^3
r_rock
#> Error: object 'r_rock' not found
R_rocks
#> Error: object 'R_rocks' not found

# function_name(arg1 = val1, arg2 = val2, ...)

seq(1, 10)
#>  [1]  1  2  3  4  5  6  7  8  9 10

x <- "hello world"

y <- seq(1, 10, length.out = 5)
y
#> [1]  1.00  3.25  5.50  7.75 10.00

(y <- seq(1, 10, length.out = 5))
#> [1]  1.00  3.25  5.50  7.75 10.00

my_variable <- 10
my_variable
#> Error in eval(expr, envir, enclos): object 'my_variable' not found

library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)

filter(diamonds, carat > 3)

# Alt + Shift + K : Keyboard shortcuts - Quick reference
# Tools -> Keyboard Shortcuts Help