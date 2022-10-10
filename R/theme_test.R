#' Wax theme
#' Personal theme and typography for ggplot2
#'
#' @examples
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#' geom_point(size = 4) -> p
#'
#' p + theme_wax()
#'
#' @import ggplot2
#' @import showtext
#'
#' @export

font_add_google(name = "Fira Sans", family = "fira-sans")
font_add_google(name = "Roboto Slab", family = "roboto-slab")
showtext_auto()

theme_wax <- function(base_size = 13,
                      family_title = "roboto-slab",
                      family_text = "fira-sans",
                      color_title = "#33302C",
                      color_text = "#1A2024",
                      color_grid = "#E8E3DC") {

  theme_light(base_size = base_size) %+replace%
    theme(
      # Text
      text = element_text(family = family_text, size = base_size, color = color_text),
      axis.text = element_text(size = base_size),
      axis.title = element_text(family = family_title, face = "bold", size = rel(1.25)),
      plot.title = element_text(family = family_title, face = "bold",
                                size = rel(1.67), hjust = 0, color = color_title),
      plot.subtitle = element_text(family = family_title, size = 16,
                                   margin = margin(0.2, 0, 1, 0, unit = "cm"),
                                   hjust = 0, color = color_title),
      plot.caption = element_text(size = rel(.9), margin = margin(.5, 0, 0, 0, unit = "cm"), hjust = 1),
      legend.title = element_text(family = family_title, size = rel(1.1), face = "bold", hjust = 0),
      legend.text = element_text(size=rel(1)),
      # fill, grid, background
      plot.background = element_blank(),
      panel.background = element_blank(),
      panel.grid.minor = element_line(color = color_grid, size = rel(.2)),
      panel.grid.major =  element_line(color = color_grid, size =  rel(.5)),
      panel.border  = element_rect(colour = color_grid, fill = NA, size = rel(2)),
      strip.background = element_blank(),
      legend.background = element_blank(),
      # Margin, position
      plot.margin = margin(.5, .5, .5, .5, unit = "cm"),
      axis.title.x = element_text(margin = margin(0.5, 0, 0, 0, unit = "cm")),
      axis.title.y = element_text(margin = margin(0, 0.5, 0, 0, unit = "cm"), angle =90),
      legend.position = "bottom",
      legend.box = "horizontal",
      panel.spacing.x = grid::unit(2, "lines"), # Space between facets
      # Other
      legend.key.size = unit(.5, 'cm'),
      axis.ticks = element_blank(),
      strip.text = element_text(size = rel(1), face = "bold", margin = margin(0, 0, .25, 0, unit = "cm"))
    )
}