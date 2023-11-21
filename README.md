# Pytorch and GDAL Template

This project is a template for using PyTorch and GDAL 1.8.0 in Docker container.
python package manager is poetry.

## Prerequisites

Before you begin, ensure you have met the following requirements:

* You have installed the latest version of Docker and Docker Compose v2.
* You have to install CUDA12 and NVIDIA Container Toolkit if you want to use GPU.

## Using Project

To use this project, follow these steps:

1. Clone the repository: `git clone <repository_url>`
2. Navigate to the project directory: `cd <project_directory>`
3. Build the Docker images: `make build`
4. Start the services: `make up`
5. To get into container shell, use: `make shell`
6. To stop the services, use: `make down`


## When you want to use CPU in this project.
Please delete follwing lines in docker-compose.yml.
```
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```


## When you want to use multi-GPU in this project.

And please change ```devices count``` in docker-compose.yml like this.
```
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

to
```
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 2
              capabilities: [gpu]
```


## Contributing to Project

To contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b <branch_name>`
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

## Contact

If you want to contact me you can reach me at `torumitsutake@gmail.com`.

## License

This project uses the following license: `Apache License 2.0`.