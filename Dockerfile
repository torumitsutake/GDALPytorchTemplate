FROM pytorch/pytorch:latest

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y tzdata  g++ cmake wget
RUN wget https://github.com/OSGeo/gdal/releases/download/v3.8.0/gdal-3.8.0.tar.gz
RUN tar -zxvf gdal-3.8.0.tar.gz 
RUN pip install numpy 

# Install PROJ library
RUN apt-get install -y libproj-dev

# Build and install GDAL
RUN cd gdal-3.8.0 && mkdir build && cd build && cmake ..
RUN cd gdal-3.8.0/build/ && cmake --build . && cmake --build . --target install

# Update the library path
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Update the linker cache
RUN ldconfig
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libgl1-mesa-dev libopencv-dev 

RUN pip install --upgrade pip
RUN pip install poetry

WORKDIR /app

COPY pyproject.toml pyproject.toml
RUN poetry add numpy
RUN GDAL_VERSION=$(gdal-config --version) && poetry add GDAL==$GDAL_VERSION


RUN poetry install

ENV TORCH_HOME=/app/torch
ENV SHELL=/bin/bash


CMD ["poetry", "shell"]