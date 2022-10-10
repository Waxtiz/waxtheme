wax_colours <- list(
  d_pal = c(
            "#45c7c8",
            "#d04e2c",
            "#626edd",
            "#65c653",
            "#af5dd3",
            "#579b2f",
            "#cc4dac",
            "#45c27f",
            "#e14b8c",
            "#448237",
            "#8451a5",
            "#abb639",
            "#6274b9",
            "#dd862f",
            "#5fa3da",
            "#cca43f",
            "#d08dcf",
            "#797623",
            "#ba3560",
            "#6bbb8e",
            "#d4424f",
            "#31947c",
            "#e58192",
            "#31784c",
            "#9a4d78",
            "#a0b56c",
            "#ac554f",
            "#6d733b",
            "#e0976e",
            "#9a612b"
  ),
  c_binar_pal = c(
             "#865eac",
             "#9875b8",
             "#aa8dc3",
             "#bca5ce",
             "#cebeda",
             "#dfd7e5",
             "#f1f1f1",
             "#d9eadd",
             "#c2e4cb",
             "#a9ddb8",
             "#90d7a5",
             "#75cf93",
             "#56c881"
  ),
  c_single_hue = c(
             "#003f5c",
             "#284a78",
             "#58508d",
             "#8b5196",
             "#bc5090",
             "#e4537e",
             "#ff6361"
  )
)

#' Color and fill scales basend on wax palette
#' Personal color palette for ggplot2
#'
#' @import ggplot2
#' @import scales
#'
#' @export

wax_palettes <- function(name, n, all_palettes = wax_colours, type = c("discrete", "continuous")) {
  palette <- all_palettes[[name]]
  if (missing(n)) {
    n <- length(palette)
  }
  type <- match.arg(type)
  out <- switch(type,
               continuous = grDevices::colorRampPalette(palette)(n),
               discrete = palette[1:n]
  )
  structure(out, name = name, class = "palette")
}

#' @export
scale_colour_wax_d <- function(name = "d_pal") {
  ggplot2::scale_colour_manual(values = wax_palettes(name,
                                                     type = "discrete"))
}

#' @export
scale_fill_wax_d <- function(name = "d_pal") {
  ggplot2::scale_fill_manual(values = wax_palettes(name,
                                                   type = "discrete"))
}

#' @export
scale_colour_wax_c <- function(name = "c_single_hue") {
  ggplot2::scale_colour_gradientn(colours = wax_palettes(name = name,
                                                         type = "continuous"))
}

#' @export
scale_fill_wax_c <- function(name = "c_single_hue") {
  ggplot2::scale_fill_gradientn(colours = wax_palettes(name = name,
                                                       type = "continuous"))
}

#' @export
scale_color_wax_d <- function() {
  scale_colour_wax_d()
}

#' @export
scale_color_wax_c <- function() {
  scale_colour_wax_c()
}