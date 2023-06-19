#' Create a function to save ggplot2 plots to a specified directory
#'
#' This function creates a new function that saves ggplot2 plots to a specified directory. The created function can be used to easily save a series of related plots. If no file extension is provided, the plot is saved as a PNG.
#'
#' @usage ggsaver(dir)
#' @param dir A character string specifying the directory where the plot should be saved.
#' @details The function returned by ggsaver takes two parameters: name and plt.
#' @details name is a character string specifying the name of the plot. If no file extension is provided, the plot is saved as a PNG.
#' @details plt is the ggplot2 plot to be saved. If not specified, the last plot is saved.
#' @details After saving the plot, the function prints a message indicating the name of the plot and the directory where it was saved.
#' @return A function that takes the name of the plot (and optionally, the plot itself and additional arguments for ggsave) and saves the plot to the specified directory.
#' @examples
#' \dontrun{
#' library(ggplot2)
#' save.plot = ggsaver("my_plots")
#'
#' ggplot(mtcars, aes(mpg, disp)) + geom_point()
#' save.plot("mpg_vs_disp")
#'
#' ggplot(mtcars, aes(hp, disp)) + geom_point()
#' save.plot("hp_vs_disp")
#' }
#' @importFrom ggplot2 ggsave last_plot
#' @export
ggsaver = function(dir){
  function(name, plt = last_plot(), ...){
    if (tools::file_ext(name) == "") {
      name = paste0(name, ".png")
    }
    ggsave(file.path(dir, name), plt, ...)
    cat(paste0("Saved ", name, " in ", dir, ".\n\n"))
  }
}
