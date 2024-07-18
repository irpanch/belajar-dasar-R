library(timetk)
library(dplyr)
library(ggplot2)
library(zoo)
library(datasets)
library(gganimate)

df <- AirPassengers

df <- tk_tbl(df)

df <- transform(df, date=zoo::as.Date(index, frac=0))

df <- as_tibble(df)

p <- df |> 
  ggplot(aes(x=date, y=value)) +
  geom_line() +
  labs(x="Date", y = "Nummber of Air Passengers", title = 'Air Passengers per Month')+
  transition_reveal(date) +
  view_follow(fixed_y = TRUE)

animate(p, nframes = 144, fps=10, width=800, height=500)

anim_save('test_animation_ggplot.gif',p)
