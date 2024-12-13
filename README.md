# Inception 🐳 

![Description of the photo](https://github.com/AndrePortfolio/inception/blob/main/inception.png)

## Project Overview ⚙️

This project is part of the 42 curriculum and aims to enhance system administration skills using Docker. The objective is to create and configure a small infrastructure with multiple services running in isolated Docker containers. The infrastructure will be deployed on a Virtual Machine.

---

## Features 🛠️

- **NGINX**
  - Configured with TLSv1.2 or TLSv1.3 for secure connections.
- **WordPress**
  - Runs with `php-fpm` in its own container (without NGINX).
  - Uses MariaDB as the database backend.
- **MariaDB**
  - Dedicated container hosting the database.
- **Volumes**
  - Two volumes:
    1. WordPress database.
    2. WordPress website files.
- **Networking**
  - Docker network connects all containers.
  - Only the NGINX container exposes port 443 to the host machine.
- **Security**
  - No hardcoded passwords in Dockerfiles.
  - Use of environment variables and Docker secrets.
- **Resilience**
  - Containers automatically restart in case of failure.

---

## Directory Structure 🌐

```plaintext
.
├── Makefile                 # Automates Docker image building and setup
├── srcs/                    # Project source files
│   ├── docker-compose.yml   # Orchestrates container setup
│   ├── .env                 # Environment variables
│   ├── requirements/        # Service configurations
│   │   ├── mariadb/
│   │   ├── nginx/
│   │   └── wordpress/
└── README.md                # Project documentation (this file)
```

---

## Requirements 🖥️

- A Virtual Machine.
- Docker and Docker Compose.
- Basic understanding of Docker, Docker Compose, and system administration.

---

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone git@github.com:AndrePortfolio/inception.git
   cd inception
   ```

2. **Configure environment variables**
   - Edit the `.env` file in `srcs/` to match your setup.

3. **Build and start the containers**
   ```bash
   make
   ```

4. **Access the services**
   - Visit `https://andre-da.42.fr` in your browser.

---

## Key Notes

- All containers are built from scratch using Alpine or Debian.
- No pre-built Docker images are allowed (except for base images).
- Domain name configuration is required to point to your local IP.

---

## Security Best Practices 🗂️

- Use a `.env` file for non-sensitive environment variables.
- Store sensitive information (e.g., database credentials) in the `secrets/` folder.
- Ensure that sensitive files are excluded from version control by adding them to `.gitignore`.

---

## Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [NGINX with TLS](https://nginx.org/en/docs/http/configuring_https_servers.html)
- [WordPress Configuration](https://wordpress.org/support/article/editing-wp-config-php/)
- [MariaDB Documentation](https://mariadb.com/kb/en/)
