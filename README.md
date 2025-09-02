# Project handover
   - PDF-Link - [PDF](<./Project - Baby Tools Shop.pdf>)

   - LOOM-Link - [Video](https://www.loom.com/share/d2d9d6c8a7854ca78b10cfe2e8d76d27?sid=bd1c3a59-0e98-40b1-a3f9-15a3cb362e6d)

# E-Commerce Project For Baby Tools

## Table of Contents

1. [Project Overview](#project-overview)
2. [Quickstart](#quickstart)
3. [Usage](#usage)
4. [Hints](#hints)
5. [Photos](#photos)
6. [Me](#me)

## Project Overview

The **Baby Tools Shop** project is a Django-based web application that allows users to browse and purchase baby tools. The application is built with **Python** and **Django** and is designed to be easily containerized and deployed using **Docker**.


### Prerequisites

- [`requirements.txt`](./requirements.txt)

## Quickstart

To get started with the Baby Tools Shop, follow these steps:

1. **Set up your Python environment:**

   ```
   python -m venv your_environment_name
   ```

2. **Activate the virtual environment:**

   ```
   your_environment_name\Scripts\activate
   ```

3. **Navigate to the project directory:**

   ```
   cd babyshop_app
   ```

4. **Apply migrations:**

   ```
   python manage.py makemigrations
   ```

   ```
    python manage.py migrate
   ```

5. **Create a superuser:**

   ```
    python manage.py createsuperuser
   ```

   - **Important**: Use a DJANGO_SUPERUSER_USERNAME, DJANGO_SUPERUSER_EMAIL and a DJANGO_SUPERUSER_PASSWORD

6. **Run the development server:**

   ```
    python manage.py runserver
   ```

   - You can access the admin panel at http://<your_ip>:8000/admin
   - Create products in the admin panel

## Usgae

### Configuration
1.  **Configure your environment:**
    Modify the **ALLOWED_HOSTS** setting in **settings.py** to include the domain names or IP addresses that will be used to access the application.

    ```
    ALLOWED_HOSTS = ['your_domain_or_ip']
    ```

    - Configures allowed hosts: This setting specifies which domain names or IP addresses are permitted to access your Django application.
    - Enhances security: It prevents HTTP Host header attacks by only allowing requests from specified hosts.
    - Set for production: Replace 'your_domain_or_ip' with your actual domain or server IP to make your site accessible.

2.  **Create Dockerfile:**
    [`Dockerfile`](./Dockerfile)

    - Uses the minimal python:3.9-alpine image to ensure fast builds and a small footprint.
    - Copies all project files into the container, installs dependencies from
    - Launches the app via entrypoint.sh and exposes port 8025 for external access.


3. **entrypoint.sh configuration**

    [`entrypoint.sh`](./entrypoint.sh)

    - Prepared and migrate to sync database with models
    - Checker for superuser
    - start server at port 8025
    
### Deploying with Docker

1.  **Copy the Project Folder to your VM**

2.  **Build the Docker image:**
    ```
    docker build -t <name_of_application> -f Dockerfile .
    ```
    - Builds the Docker image from the Dockerfile located in the current directory.
    - Assigns a tag using -t app_name for easier identification and reference.
    - Packages the application along with its dependencies, making it ready to run inside a container.

3.  **Create Docker volumes:**

    ```
    docker volume create babyshop_volume
    ```
    - Creates volumes to persist data across container restarts and rebuilds.
    - Ensures data persistence, keeping application data safe and available even if containers are removed or recreated.


4. **Docker run to create superuser and deploy container**
    ```
    docker run -d --name app_name_container -p 8025:8025 \
    -v babyshop_volume:/app/babyshop_app \
    -e DJANGO_SUPERUSER_USERNAME=<your_user> \
    -e DJANGO_SUPERUSER_EMAIL=<your_email> \
    -e DJANGO_SUPERUSER_PASSWORD=<your_passwort> \
    --restart on-failure \
    app_name
    ```
    - start container and configure admin login

### Hints

This section will cover some hot tips when trying to interacting with this repository:

- Settings & Configuration for Django can be found in `babyshop_app/babyshop/settings.py`
- Routing: Routing information, such as available routes can be found from any `urls.py` file in `babyshop_app` and corresponding subdirectories

### Photos

##### Home Page with login

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080815407.jpg"></img>
##### Home Page with filter
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080840305.jpg"></img>
##### Product Detail Page
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080934541.jpg"></img>

##### Home Page with no login
<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323080953570.jpg"></img>


##### Register Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081016022.jpg"></img>


##### Login Page

<img alt="" src="https://github.com/MET-DEV/Django-E-Commerce/blob/master/project_images/capture_20220323081044867.jpg"></img>

### Me

- Jonathan Priebe - [LinkedIn](https://www.linkedin.com/in/jonathan-p-34471b1a5/)