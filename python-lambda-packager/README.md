1. Build the image locally by `docker build -t python-lambda-packager docker`
2. Run the container and package by using `docker run -v $(pwd):/working --rm python-lambda-packager`