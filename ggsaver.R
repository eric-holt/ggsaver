#' Create a function to save ggplot2 plots to a specified directory
#'
#' This function creates a new function that saves ggplot2 plots to a specified directory. The created function can be used to easily save a series of related plots. If no file extension is provided, the plot is saved as a PNG.
#'
#' @usage
#' save.plot <- ggsaver(dir, default.width, default.height, default.dpi, default.unit)
#' save.plot(name, plt = last_plot(), width, height, dpi, unit, ...)
#' @param dir A character string specifying the directory where the plot should be saved.
#' @param default.width The default width of the saved plot in units specified by default.unit. Defaults to 180.
#' @param default.height The default height of the saved plot in units specified by default.unit. Defaults to 150.
#' @param default.dpi The default resolution of the saved plot in DPI. Defaults to 300.
#' @param default.unit The default unit for the width and height of the saved plot. Defaults to "mm".
#' @param name A character string specifying the name of the plot. If no file extension is provided, the plot is saved as a PNG.
#' @param plt The ggplot2 plot to be saved. If not specified, the last plot is saved.
#' @param width The width of the saved plot in units specified by unit. If not specified, default.width is used.
#' @param height The height of the saved plot in units specified by unit. If not specified, default.height is used.
#' @param dpi The resolution of the saved plot in DPI. If not specified, default.dpi is used.
#' @param unit The unit for the width and height of the saved plot. If not specified, default.unit is used.
#' @param ... Additional arguments passed to ggsave.
#' @details After saving the plot, the function prints a message indicating the name of the plot and the directory where it was saved.
#' @return A function that takes the name of the plot (and optionally, the plot itself and additional arguments for ggsave) and saves the plot to the specified directory.
#' @examples
#' \dontrun{
#' library(ggplot2)
#' save.plot = ggsaver("my_plots", default.width = 200, default.height = 200, default.dpi = 300, default.unit = "mm")
#'
#' ggplot(mtcars, aes(mpg, disp)) + geom_point()
#' save.plot("mpg_vs_disp", width = 250, height = 250)
#'
#' ggplot(mtcars, aes(hp, disp)) + geom_point()
#' save.plot("hp_vs_disp", dpi = 400)
#' }
#' @export
ggsaver = function(dir,
                   default.width = 180,
                   default.height = 150,
                   default.dpi = 300,
                   default.unit = "mm"){
  function(name, plt = last_plot(),
           width = default.width,
           height = default.height,
           dpi = default.dpi,
           unit = default.unit, ...){
    if (tools::file_ext(name) == "") {
      name = paste0(name, ".png")
    }
    filepath = file.path(dir, name)
    tryCatch({
      ggsave(name, plt, path = dir,
             width = width,
             height = height,
             dpi = dpi,
             units = unit, ...)
      cat("Saved", filepath, "\n\n")
    }, error = function(e) {
      cat("Failed to save", filepath, "\n\n")
      message("Error: ", e$message)
    })
  }
}
