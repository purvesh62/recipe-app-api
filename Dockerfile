FROM python:3.9-alpine3.13

LABEL maintainer="purvesh.me"

# This is recommended when running app on Docker
# the console output doesn't get buffered.
ENV PYTHONBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt

COPY ./requirements.dev.txt /tmp/requirements.dev.txt

COPY ./ /app

WORKDIR /app

EXPOSE 8000

ARG DEV=false

# Create a virtual environment
# Upgrade pip
# Install requirements.txt
# Install requrements.dev.txt if DEV argument is "true"
# Delete /tmp folder
# Add user inside the image. Recommended to not use the root user.
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
      then /py/bin/pip install -r /tmp/requirements.dev.txt; \
    fi &&  \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user


# Update the PATH environment variable
ENV PATH = "/py/bin:$PATH"

# Switch the user to the given one below instead of the root.
USER django-user