FROM python:3.9.18-slim-bullseye

WORKDIR /python-docker

COPY requirements-backend.txt requirements-backend.txt
RUN pip3 install -r requirements-backend.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]