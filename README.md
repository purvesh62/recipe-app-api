# recipe-app-api

Recipe API Django project

#### List of commands executed.

```shell
# Build image
docker compose build


# Create a Django project
docker compose run --rm app sh -c "django-admin startproject app ."

# Create core services
docker compose run --rm app sh -c "python manage.py startapp core"
```