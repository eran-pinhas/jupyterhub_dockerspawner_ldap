FROM jupyter/minimal-notebook

USER root


RUN sudo apt-get update
RUN apt-get upgrade -y
RUN sudo apt-get install -y software-properties-common

#RUN cat /etc/os-release
# RUN add-apt-repository ppa:ubuntugis-unstable

# Install GDAL dependencies
RUN apt-get install -y python3-pip libgdal-dev locales

# Ensure locales configured correctly
RUN locale-gen en_US.UTF-8
ENV LC_ALL='en_US.utf8'

# Set python aliases for python3
RUN echo 'alias python=python3' >> ~/.bashrc
RUN echo 'alias pip=pip3' >> ~/.bashrc

# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

# This will install latest version of GDAL
RUN pip install GDAL==2.2.3

RUN pip install geopandas matplotlib numpy pyshp pyproj xlsxwriter scikit-learn pandas scipy descartes networkx rtree geomet pysal arcgis xlrd xlwt xlutils pillow owslib opencv-python plyfile

RUN apt-get install -y libgeos-3.6.2 libgeos-c1v5 libgeos-dev
# RUN pip install https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz

RUN pip install git+https://github.com/matplotlib/basemap.git
Run pip install ipyleaflet

# RUN pip install jupyter_contrib_nbextensions
RUN conda install -y -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension enable hinterland/hinterland
RUN jupyter nbextension enable codefolding/main
RUN jupyter nbextension enable ipyleaflet

RUN sudo apt-get install -y python3-rtree

WORKDIR /home/jovyan/work

USER $NB_UID
