library(ggplot2)
library(waxtheme)

sysfonts::font_add_google(name = "Fira Sans", family = "fira-sans")
sysfonts::font_add_google(name = "Roboto Slab", family = "roboto-slab")

showtext::showtext_auto()

ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point() +
  labs(title = "First, a chart title",
       subtitle = "Below, a subtitle",
       caption = "And finally, a caption text.") -> p1

p1 + theme_wax() +
  scale_color_wax(discrete = T) -> p2

gridExtra::grid.arrange(p1, p2, nrow = 1) -> p_out

ggsave("./readme_files/Rplot01.png", p_out,
       width = 1500, height = 700,
       dpi = 100, units = "px")


ggplot(diamonds, aes(carat, price, color = price))+
  geom_point(alpha = .5)+
  theme_wax()+
  scale_color_wax()

ggplot(diamonds, aes(carat, price, color = price))+
  geom_point()+
  theme_wax()+
  scale_color_wax()

ggplot(diamonds, aes(carat, price, color = price))+
  geom_point()+
  theme_wax()+
  scale_color_viridis_c()

ggplot(mpg, aes(cty, manufacturer, fill = manufacturer)) +
  geom_boxplot()+
  theme_wax(theme = "defaut")+
  scale_fill_wax(discrete = T)

ggplot(mpg, aes(cty, manufacturer, color = manufacturer)) +
  geom_boxplot()+
  theme_wax()+
  scale_color_wax(discrete = T)

scale_fill_gradientn(colours = wax_pal(256, alpha, begin, end, direction, option))

unique(mpg$manufacturer)


colfunc <- colorRampPalette(c("#003f5c",
             "#8b5196",
             "#ff6361",
             "#ffb140"))
colfunc(100) -> test


dat <- data.frame(x = rnorm(10000), y = rnorm(10000))
ggplot(dat, aes(x = x, y = y)) +
  geom_hex() +
  coord_equal() -> p1

p1 +
  theme_wax()+
  scale_fill_wax() -> p2

gridExtra::grid.arrange(p1, p2, nrow = 1) -> p_out

ggsave("./readme_files/Rplot02.png", p_out,
       width = 1500, height = 700,
       dpi = 100, units = "px")