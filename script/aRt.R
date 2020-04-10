library(dplyr)
library(jasmines)
library(patchwork)
library(tidyverse)

layout <- c(
    area(t = 1, l = 1, b = 2, r = 2),
    area(t = 3, l = 1, b = 4, r = 2),
    area(t = 1, l = 3, b = 2, r = 4),
    area(t = 3, l = 3, b = 4, r = 4),
    area(t = 1, l = 5, b = 2, r = 6),
    area(t = 3, l = 5, b = 4, r = 6),
    area(t = 1, l = 7, b = 2, r = 8),
    area(t = 3, l = 7, b = 4, r = 8),
    area(t = 1, l = 9, b = 2, r = 10),
    area(t = 3, l = 9, b = 4, r = 10),
    #
    area(t = 5, l = 1, b = 6, r = 2),
    area(t = 7, l = 1, b = 8, r = 2),
    area(t = 5, l = 3, b = 6, r = 4),
    area(t = 7, l = 3, b = 8, r = 4),
    area(t = 5, l = 5, b = 6, r = 6),
    area(t = 7, l = 5, b = 8, r = 6),
    area(t = 5, l = 7, b = 6, r = 8),
    area(t = 7, l = 7, b = 8, r = 8),
    area(t = 5, l = 9, b = 6, r = 10),
    area(t = 7, l = 9, b = 8, r = 10),
    #
    area(t = 9, l = 1, b = 10, r = 2),
    area(t = 11, l = 1, b = 12, r = 2),
    area(t = 9, l = 3, b = 10, r = 4),
    area(t = 11, l = 3, b = 12, r = 4),
    area(t = 9, l = 5, b = 10, r = 6),
    area(t = 11, l = 5, b = 12, r = 6),
    area(t = 9, l = 7, b = 10, r = 8),
    area(t = 11, l = 7, b = 12, r = 8),
    area(t = 9, l = 9, b = 10, r = 10),
    area(t = 11, l = 9, b = 12, r = 10),
    #
    area(t = 13, l = 1, b = 14, r = 2),
    area(t = 13, l = 3, b = 14, r = 4)
)
plot(layout)

p <- vector(mode = "list", length = 32)
col <- palette_named()
for (i in 1:32){
p[[i]] <- use_seed(1) %>%
    scene_discs(
        rings = 3, points = 1500, size = 5
    ) %>%
    mutate(ind = 1:n()) %>%
    unfold_warp(
        iterations = 5,
        scale = .5, 
        output = "layer" 
    ) %>%
    unfold_tempest(
        iterations = 20,
        scale = .1
    ) %>%
    style_ribbon(
        palette = col[i],
        colour = "ind",
        alpha = c(.5,.01),
        background = "black"
    ) +
    coord_fixed(ratio = 1)
}
p[[1]] + p[[2]] + p[[3]] + p[[4]]  + p[[5]] + p[[6]] + p[[7]] + p[[8]] + p[[9]] + p[[10]] +
    plot_layout(design = layout)


wrap_plots(p, ncol = 5)



