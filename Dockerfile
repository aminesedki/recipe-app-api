FROM python:3.9-alpine3.13

ENV PYTHONUNBUFFERED=1

# Set environment variables
ENV VIRTUAL_ENV=/opt/venv

# Create a virtual environment
RUN python -m venv $VIRTUAL_ENV

# Add virtualenv to PATH
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app

WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN echo "DEV is $DEV"
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    if [ "$DEV" = "true" ]; then \
        pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

USER django-user