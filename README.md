# Docker in AWS Todobackend Sample Application

This repository provides a sample application based upon the [Todo-backend project](https://www.todobackend.com).

curl localhost:8000/todos | jq
curl -X PATCH -H "Content-Type: application/json" localhost:8000/todos/2 -d '{"completed": true}'

-- testing the sample application locally
pip3 install -r requirements_test.txt --user

python3 manage.py test --settings todobackend.settings_test

docker build --target test -t todobackend-test .
