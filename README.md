docker build -t my_lambda_image .
docker run --rm -it -v $(pwd):/var/task my_lambda_image /bin/bash

docker run --rm -it --entrypoint /bin/bash my_lambda_image

docker run --rm -it -v $(pwd):/var/task --entrypoint /bin/bash my_lambda_image

mkdir my_lambda_function
cd my_lambda_function
pip install pytz -t .
pip install cryptography -t .
zip -r lambdacookies.zip .

my image developed in arm64, so lambda function terraform should arm64
