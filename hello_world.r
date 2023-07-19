print("hello world")

library(ggplot2)
library(dplyr)
library(nycflights13)
library(knitr)

# pipe operator inserts lhs into rhs function. Has some subtle difference from straight funciton call but usually doesn't matter.
# alaska_flights = flights %>% 
#   filter(carrier == "AS")
alaska_flights = filter(flights, carrier=="AS")
# scatter plot
ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_point(alpha = 0.2)

# line graph
early_january_weather = filter(weather, origin == "EWR" & month == 1 & day <= 15)
ggplot(data = early_january_weather, 
       mapping = aes(x = time_hour, y = temp)) +
  geom_line()

# facets. This breaks up the data by month and makes the same histogram 12 times--one for each month
ggplot(data = weather, mapping = aes(x = temp)) +
  geom_histogram(binwidth = 5, color = "white") +
  facet_wrap(~ month)
