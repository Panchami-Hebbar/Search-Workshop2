FROM public.ecr.aws/docker/library/python:3.10

RUN apt-get update && apt-get install -y postgresql-client
COPY ./requirements.txt ./requirements.txt
RUN pip install -r requirements.txt

ENV POSTGRES_DB='amazon'
ENV POSTGRES_USER='workshop_user'

ENV POSTGRES_PASSWORD='workshop_user1'

ENV POSTGRES_HOST='127.0.0.1'
ENV POSTGRES_PORT='5435'

ENV ES_HOST='127.0.0.1'
ENV ES_PORT='9200'

COPY ./ ./

WORKDIR src/app/