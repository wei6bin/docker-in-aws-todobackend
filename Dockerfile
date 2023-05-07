# Test Stage
FROM alpine AS test
LABEL application=todobackend

# install basic utilities
RUN apk add --no-cache bash git

# install build dependencies
RUN apk add --no-cache gcc python3-dev libffi-dev musl-dev linux-headers mariadb-dev
RUN pip3 install wheel

# copy requirements
COPY /src/requirements* /build/
WORKDIR /build

# build and install requirements
RUN pip3 wheel -r requirements_test.txt --no-cache-dir --no-input
RUN pip3 install requirements_test.txt -f /build --no-index --no-cache-dir

# copy source code
COPY /src /app
WORKDIR /app

# test entrypoint
CMD ["python3", "manage.py", "test", "--noinput", "--settings=todobackend.settings_test"]

