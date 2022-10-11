wax_colours <- list(
  d_pal = c(
            "#ff6361",
            "#8b5196",
            "#ffb140",
            "#087E8B",
            "#0B3954",
            "#DD7373",
            "#4C5B5C",
            "#D64550",
            "#DAEFB3",
            "#3B3561",
            "#D1D1D1",
            "#EAD94C",
            "#EA1744",
            "#30BCED",
            "#DD4B1A",
            "#EAB464",
            "#FAAA8D",
            "#FEEFDD",
            "#B88E8D",
            "#351431",
            "#5F1A57",
            "#34435E",
            "#696D7D",
            "#235789",
            "#E34A6F"
  ),
  c_binar_pal = c(
             "#8b5196",
             "#003f5c",
             "#ff6361"
  ),
  c_single_hue = c(
             "#003f5c",
             "#8b5196",
             "#ff6361",
             "#ffb140"
  )
)

#' Prepare color palette like viridis methode
#'
#' @param n The number of colors (\ge 1) to be in the palette.
#' @param alpha The alpha transparency, a number in [0,1], see argument alpha in hsv.
#' @param begin The (corrected) hue in [0,1] at which the color map begins.
#' @param end The (corrected) hue in [0,1] at which the color map ends.
#' @param direction Sets the order of colors in the scale. If 1, the default, colors are ordered from darkest to lightest. If -1, the order of colors is reversed.
#' @param option Choice of palette
#'
#' @export
wax_pal <- function(n, alpha = 1, begin = 0, end = 1, direction = 1, option = "c_single_hue") {
  if (begin < 0 | begin > 1 | end < 0 | end > 1) {
    stop("begin and end must be in [0,1]")
  }
  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }
  if (n == 0) {
    return(character(0))
  }
  if (direction == -1) {
    tmp <- begin
    begin <- end
    end <- tmp
  }
  map_cols <- wax_colours[[option]]
  fn_cols <- grDevices::colorRamp(map_cols, space = "Lab", interpolate = "spline")
  cols <- fn_cols(seq(begin, end, length.out = n)) / 255
  grDevices::rgb(cols[, 1], cols[, 2], cols[, 3], alpha = alpha)
}

#' Generate color palette like viridis methode
#'
#' @param n The number of colors (\ge 1) to be in the palette.
#' @param alpha The alpha transparency, a number in [0,1], see argument alpha in hsv.
#' @param begin The (corrected) hue in [0,1] at which the color map begins.
#' @param end The (corrected) hue in [0,1] at which the color map ends.
#' @param direction Sets the order of colors in the scale. If 1, the default, colors are ordered from darkest to lightest. If -1, the order of colors is reversed.
#' @param option Choice of palette
#'
#' @export
wax_pal2 <- function(alpha = 1, begin = 0, end = 1, direction = 1, option = "c_single_hue") {
  function(n) {
    wax_pal(n, alpha, begin, end, direction, option)
  }
}

#' Scale color from wax_palette
#'
#' @param n The number of colors (\ge 1) to be in the palette.
#' @param alpha The alpha transparency, a number in [0,1], see argument alpha in hsv.
#' @param begin The (corrected) hue in [0,1] at which the color map begins.
#' @param end The (corrected) hue in [0,1] at which the color map ends.
#' @param direction Sets the order of colors in the scale. If 1, the default, colors are ordered from darkest to lightest. If -1, the order of colors is reversed.
#' @param option Choice of palette
#'
#' @export
scale_color_wax <- function(..., alpha = 1, begin = 0, end = 1, direction = 1,
                                discrete = FALSE, option = "c_single_hue") {
  if (discrete) {
    discrete_scale("colour", "viridis", wax_pal2(alpha, begin, end, direction, option), ...)
  } else {
    scale_color_gradientn(colours = wax_pal(256, alpha, begin, end, direction, option), ...,
                          guide = guide_colorbar(barwidth = unit(5, 'cm'),
                                                 title.vjust = 0.9))
  }
}


#' Scale fill from wax_palette
#'
#' @param n The number of colors (\ge 1) to be in the palette.
#' @param alpha The alpha transparency, a number in [0,1], see argument alpha in hsv.
#' @param begin The (corrected) hue in [0,1] at which the color map begins.
#' @param end The (corrected) hue in [0,1] at which the color map ends.
#' @param direction Sets the order of colors in the scale. If 1, the default, colors are ordered from darkest to lightest. If -1, the order of colors is reversed.
#' @param option Choice of palette
#'
#' @export

scale_fill_wax <- function(..., alpha = 1, begin = 0, end = 1, direction = 1,
                                discrete = FALSE, option = "c_single_hue") {
  if (discrete) {
    discrete_scale("fill", "viridis", wax_pal2(alpha, begin, end, direction, option), ...)
  } else {
    scale_fill_gradientn(colours = wax_pal(256, alpha, begin, end, direction, option), ...,
                         guide = guide_colorbar(barwidth = unit(5, 'cm'),
                                                title.vjust = 0.9))
  }
}
