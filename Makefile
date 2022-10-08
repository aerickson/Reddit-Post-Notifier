build:
	docker container rm rpn || true && docker build -t rpn . && docker create --name "rpn" rpn

run:
	docker run -it --entrypoint /bin/bash rpn
