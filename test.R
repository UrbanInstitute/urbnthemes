library(tidyverse)
library(uithemes)

set_urban_defaults()

ggplot(mtcars, aes(wt, mpg)) +
  geom_point()

mtcars %>%
  mutate(Cylinders = factor(cyl)) %>%
  ggplot(mapping = aes(x = wt, y = mpg, colour = Cylinders)) +
  geom_point(size = 3) +
  labs(title = "Fuel Efficiency Declines as Weight Increases",
       caption = "Urban Institute",
       x = "Weight (Tons)",
       y = "Miles Per Gallon") +
  theme(legend.title = element_text(hjust = 0)) +
  scale_fill_urban()

#5 colors (dodged)
ggplot(data = diamonds, mapping = aes(clarity, fill = cut)) +
  geom_bar(position = "dodge") +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 6000), labels = scales::comma) +
  labs(title = "Diamond Clarity",
       subtitle = "Something Informative About Diamonds",
       caption = "The Source of Diamond Data",
       x = "Clarity",
       y = "Count") +
  scale_color_urban()




ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_hex(mapping = aes(fill = ..count..)) +
  scale_y_continuous(expand = c(0, 0), labels = scales::dollar) +
  labs(title = "Title",
       subtitle = "geom_hex adds clarity to overlapping points",
       x = "Carat",
       y = "Price") +
  theme(legend.position = "right",
        legend.direction = "vertical")


scale_fill_gradientn <- scale_fill_gradientn_urban()

