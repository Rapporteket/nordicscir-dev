FROM rapporteket/dev:nightly

LABEL maintainer "Are Edvardsen <are.edvardsen@helse-nord.no>"

# add registry dev config and R pkg dependencies
COPY --chown=rstudio:rstudio db.yml /home/rstudio/rap_config/
RUN cat /home/rstudio/rap_config/db.yml >> /home/rstudio/rap_config/dbConfig.yml \
    && rm /home/rstudio/rap_config/db.yml \
    && R -e "install.packages(c('covr', \
                                'dplyr', \
                                'ggplot2', \
                                'kableExtra', \
                                'knitr', \
                                'lintr', \
                                'lubridate', \
                                'magrittr', \
                                'rlang', \
                                'shiny', \
                                'shinyalert', \
                                'shinyjs', \
                                'testthat', \
                                'xtable'))" \
    && R -e "remotes::install_github(c('Rapporteket/rapbase@*release', \
                                       'Rapporteket/rapFigurer', \
                                       'Rapporteket/raplog'))"
