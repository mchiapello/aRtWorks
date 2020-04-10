library(jasmines)
library(patchwork)
library(tidyverse)
library(blastula)
library(here)

################################################################################
# Inizialize the project
# renv::init()
setwd(here())

p <- vector(mode = "list", length = 2)
col <- palette_named()[24:25]
for (i in 1:2){
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

wrap_plots(p)


email <- render_email("script/email.Rmd")

email %>%
    smtp_send(
              from = "chiapello.m@gmail.com",
              to = "chiapello.m@gmail.com",
              subject = "aRt project",
              credentials = creds_key(id = "Marco Chiapello")
    )
