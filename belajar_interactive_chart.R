
# loading library ---------------------------------------------------------

library(dplyr)
library(highcharter)
library(gapminder)


# simple column chart -----------------------------------------------------
avg_le_continent <- gapminder %>% 
  group_by(continent) %>% 
  summarise(AvgLifExp = round(mean(lifeExp),1)) %>% 
  arrange(desc(AvgLifExp))

avg_le_continent

hchart(
  avg_le_continent,
  "column",
  hcaes(x=continent, y=AvgLifExp),
  color = "#0198f9",
  name = "Rata-rata umur hidup"
) |> hc_title(text = "Rata-rata umur hidup orang dalam tiap benua") |> 
  hc_subtitle(text="sumber: Gapminder datasaet") |> 
  hc_credits(text="appsilon.com", enabled=TRUE) |> 
  hc_xAxis(title=list(text="Benua")) |> 
  hc_yAxis(title=list(text="Rata-rata umur hidup")) |> 
  hc_add_theme(hc_theme_ffx()) |> 
  hc_tooltip(formatter=JS("function(){return '<b>Benua: ' + this.point.name + '</b><br>Perkiraan umur: ' + this.y + ' tahun';}"))


# simple scatter plot  ----------------------------------------------------

avg_le_europe <- gapminder |> 
  filter(continent == "Europe") |> 
  group_by(year) |> 
  summarise(AvgLifeExp = round(mean(lifeExp),1))

avg_le_europe

hchart (avg_le_europe, "point", hcaes(x=year, y = AvgLifeExp), color="#800000",
        name = "Rata-rata umur hidup") |> 
  hc_title(text = "Rata-rata umur hidup orang di benua eropa") |> 
  hc_xAxis(title=list(text="Tahun")) |> 
  hc_yAxis(title=list(text="Rata-rata umur hidup"))

# multiscatter plot -------------------------------------------------------

avg_le_euorope_asia <- gapminder |> 
  filter(continent %in% c("Europe","Asia")) |> 
  group_by(continent, year) |> 
  summarise(AvgLifeExp = mean(lifeExp))

avg_le_euorope_asia

hchart(avg_le_euorope_asia, "point", hcaes(x=year, y=AvgLifeExp, group=continent)) |>
  hc_title(text="Rata-rata umur hidup orang di benua eropa dan Asia") |> 
  hc_xAxis(title=list(text="Tahun")) |> 
  hc_yAxis(title=list(text="Rata-rata umur hidup")) |> 
  hc_colors(c("#0198f9", "#800000"))
  

# line chart --------------------------------------------------------------

hchart(avg_le_euorope_asia, "line", hcaes(x=year, y=AvgLifeExp, group=continent)) |>
  hc_title(text="Rata-rata umur hidup orang di benua eropa dan Asia") |> 
  hc_xAxis(title=list(text="Tahun")) |> 
  hc_yAxis(title=list(text="Rata-rata umur hidup")) |> 
  hc_colors(c("#0198f9", "#800000"))


# histogram ---------------------------------------------------------------

hchart(gapminder$lifeExp, name="Perkiraan Umur", color="#800000") |> 
  hc_title(text="Histogram Rata-rata umur hidup orang") |> 
  hc_xAxis(title=list(text="Perkiraan Umur")) |> 
  hc_yAxis(title=list(text="Jumlah")) 
# buat data untuk 10 tahun terakhir, supaya ngga muncul angka yang sangat rendah.

lifeExp_prev_10years 

View(gapminder)



# pie charts --------------------------------------------------------------

population <- gapminder |> 
  filter(country %in% c("Germany", "France", "Spain")) |> 
  filter(year == 2007)
population

hchart(population, "pie",  name = "populasi", hcaes(name=country, y=pop)) |>
  hc_title(text="Population in pie chart") |> 
  hc_colors(c("#0198f9", "#800000", "#ffcc33"))
