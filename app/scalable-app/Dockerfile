FROM python:3.9.18-slim-bullseye

WORKDIR /python-docker

COPY requirements-scalable.txt requirements-scalable.txt
RUN pip3 install -r requirements-scalable.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]