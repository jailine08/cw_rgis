library(tidyverse)

set.seed(123)

iris_sub <- as_tibble(iris) %>% 
  group_by(Species) %>% 
  sample_n(3) %>% 
  ungroup()

print(iris_sub)

filter(iris_sub, Species == "virginica")
filter(iris_sub, Species != "setosa")

filter(iris_sub, Petal.Length > 5,
       Sepal.Length > 5)

arrange(iris_sub, desc(Sepal.Width))

select(iris_sub, c(Sepal.Length, Sepal.Width))

#Mutate()

(x_max <- nrow(iris_sub))
x <- 1:x_max

mutate(iris_sub, row_id = x)
mutate(iris_sub, mu_sl = mean(Sepal.Length))
# twice `Sepal.Length` and add as a new column
mutate(iris_sub, sl_two_times = 2 * Sepal.Length)

# Pipe
iris_sub %>%
  group_by(Species) %>%
  summarize(mu_sl = mean(Sepal.Length))
