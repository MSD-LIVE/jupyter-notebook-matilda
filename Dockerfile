# Use the MSD-LIVE official Jupyter R notebook image as the base
FROM ghcr.io/msd-live/jupyter/datascience-notebook:latest AS build-image

# Switch to the root user to allow installation of system-wide software
USER root

# Clone the Matilda repository from GitHub into the container
RUN git clone --branch main https://github.com/JGCRI/matilda.git /home/jovyan/matilda 

# Install the Matilda R package using devtools inside the container
RUN R -e 'install.packages("devtools", repos="https://cloud.r-project.org")'
RUN R -e 'library("devtools"); devtools::install("/home/jovyan/matilda")'

COPY notebooks /home/jovyan/notebooks
