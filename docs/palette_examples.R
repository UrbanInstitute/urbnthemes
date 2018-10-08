```{r diverging, eval = FALSE}
library(tidyverse)
library(urbnthemes)

set_urbn_defaults(style = "print")

mtcars %>%
  mutate(ntile_hp = ntile(hp, 8)) %>%
  ggplot(aes(wt, mpg, color = factor(ntile_hp))) +
  geom_point() +
  scale_color_manual(values = palette_urbn_diverging)
```




library(tidyverse)
library(urbnthemes)

set_urbn_defaults(style = "print")

diamonds %>%
  mutate(centered_price = price - mean(price)) %>%
  ggplot(aes(carat, depth, color = centered_price)) +
  geom_point(alpha = 0.1) +
  scale_color_gradientn(colors = palette_urbn_diverging)

diamonds %>%
  mutate(quintile_price = factor(ntile(price , 5))) %>%
  ggplot(aes(carat, depth, color = quintile_price)) +
  geom_point(alpha = 0.1) +
  scale_color_manual(values = palette_urbn_quintile)


diamonds %>%
  sample_n(1000) %>% # sample 1000 random points
  mutate(quintile_table = factor(ntile(table, 5))) %>% # create quintiles
  ggplot(aes(carat, price, color = quintile_table)) +
  geom_point(alpha = 0.5) +
  scale_color_manual(values = palette_urbn_quintile)




midwest %>%
  ggplot(aes(area, popdensity)) +
  geom_point()

popdensity
popblack
