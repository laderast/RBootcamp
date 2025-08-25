library(knitr)

knit_print.data.frame <- function (x, options, ...) {
  rmarkdown::paged_table(x, options) |>
    rmarkdown:::print.paged_df()
}

registerS3method("knit_print", "data.frame", knit_print.data.frame)