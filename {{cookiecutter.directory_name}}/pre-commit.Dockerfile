FROM python:3.8-slim

RUN apt-get update && \
    apt-get install -y git && \
    pip install pipenv

COPY ${project_root}/Pipfile* ./

RUN pipenv sync --dev --system

WORKDIR /sourcecode
CMD pre-commit run --all-files
