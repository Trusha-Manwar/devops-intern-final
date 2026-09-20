# DevOps Intern Final Assessment

**Name:** Trusha Manwar

## Project Description

This project demonstrates a complete DevOps workflow for a containerized NGINX web application.

The project covers Linux shell scripting, Docker containerization, GitHub Actions CI/CD, health monitoring, and container image publishing using GitHub Container Registry.

## Technologies Used

- Git
- GitHub
- Linux Shell Scripting
- Docker
- NGINX
- GitHub Actions
- GitHub Container Registry (GHCR)
- ShellCheck

## Project Structure

- `app/index.html` - Web application page
- `app/nginx.conf` - NGINX server configuration
- `app/Dockerfile` - Docker image configuration
- `scripts/sysinfo.sh` - System information script
- `scripts/healthcheck.sh` - Application health check script
- `.github/workflows/ci.yml` - GitHub Actions CI/CD workflow

## Application Features

The application provides:

- NGINX web server running on port `8080`
- `/healthz` endpoint for health checking
- Build SHA information
- Non-root Docker container execution
- Automated ShellCheck validation
- Automated Docker image build
- Automated application testing
- Automatic image publishing to GHCR

## How to Run

### Linux System Information

Run:

`./scripts/sysinfo.sh`

### Application Health Check

Run:

`./scripts/healthcheck.sh`

The default health check URL is:

`http://localhost:8080/healthz`

### Build Docker Image

Run:

`docker build --build-arg BUILD_SHA=test -t devops-intern-final:test ./app`

### Run Docker Container

Run:

`docker run -d --name devops-test -p 8080:8080 devops-intern-final:test`

### Check Application

Open:

`http://localhost:8080/`

### Check Health Endpoint

Open:

`http://localhost:8080/healthz`

Expected response:

`healthy`

### Check Container User

Run:

`docker inspect --format='{{.Config.User}}' devops-test`

Expected output:

`appuser`

## CI/CD Pipeline

GitHub Actions automatically performs the following steps:

1. Checkout the repository
2. Run ShellCheck
3. Build the Docker image
4. Start the container
5. Perform health checks
6. Test the application
7. Clean up the container
8. Publish the Docker image to GitHub Container Registry

## GitHub Container Registry

The Docker image is published to GitHub Container Registry (GHCR).

Image:

`ghcr.io/trusha-manwar/devops-intern-final`

The pipeline creates:

- Git commit SHA tag
- `latest` tag

## CI Status

CIhttps://github.com/Trusha-Manwar/devops-intern-final/actions/workflows/ci.yml/badge.svghttps://github.com/Trusha-Manwar/devops-intern-final/actions/workflows/ci.yml

The GitHub Actions workflow runs automatically for pushes to `main` and `feature/*` branches and for pull requests targeting `main`.

## Git Workflow

The project follows a feature-branch workflow.

Typical workflow:

1. Create a feature branch
2. Make changes
3. Commit changes
4. Push the branch
5. Create a Pull Request
6. Review and merge into `main`

## Docker Security

The Docker container is configured to run as a non-root user.

The application files and required NGINX directories are assigned to `appuser`.

## Current Project Status

Implemented components:

- Git and GitHub workflow
- Feature branch and Pull Request workflow
- Linux shell scripts
- ShellCheck validation
- Docker containerization
- NGINX configuration
- Application health endpoint
- Non-root container execution
- GitHub Actions CI
- GitHub Container Registry publishing
- `v1.0.0` release/tag

Remaining assessment components:

- Nomad deployment
- Loki, Promtail and Grafana observability
- Final architecture documentation and evidence

## Troubleshooting

If the application does not start, make sure Docker Desktop is running.

If port `8080` is already in use, stop the existing container or use another available port.

If the health check fails, verify that the container is running and that the `/healthz` endpoint returns HTTP 200.

## Known Limitations

Nomad deployment and centralized observability using Loki, Promtail, and Grafana are remaining components of the final assessment.

## Project Repository

GitHub Repository:

`https://github.com/Trusha-Manwar/devops-intern-final`

---