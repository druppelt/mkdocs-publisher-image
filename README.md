# MkDocs Publisher Docker Image 🚀

<p align="center">
<a href="https://github.com/ALameLlama/mkdocs-publisher-image/actions/workflows/docker-publish.yml"><img src="https://img.shields.io/github/actions/workflow/status/ALameLlama/mkdocs-publisher-image/.github/workflows/docker-publish.yml" alt="Build"></a>
<a href="https://hub.docker.com/r/alamellama/mkdocs-publisher"><img alt="Docker Image Version" src="https://img.shields.io/docker/v/alamellama/mkdocs-publisher"></a>
<a href="https://hub.docker.com/r/alamellama/mkdocs-publisher"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/alamellama/mkdocs-publisher"></a>
<a href="https://hub.docker.com/r/alamellama/mkdocs-publisher"><img alt="Docker Image Size (tag)" src="https://img.shields.io/docker/image-size/alamellama/mkdocs-publisher/latest"></a>
<a href="https://github.com/ALameLlama/mkdocs-publisher-image/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License"></a>
</p>

This repository contains a Dockerized version of MkDocs, a static site generator for project documentation, and the `mkdocs-publisher` plugin for enhanced publishing capabilities. The Docker image is designed to simplify hosting and serving MkDocs-based documentation sites.

## Features ✨

- **MkDocs Pre-installed**: A fast, easy-to-use static site generator.
- **MkDocs Publisher Plugin**: Adds advanced publishing functionality.
- **Lightweight Image**: Based on the official Python alpine image.
- **Multi-Architecture Support**: Built for both `amd64` and `arm64`.

## Usage 🛠️

### Pull the Docker Image

Pull the pre-built image from Docker Hub:

```bash
docker pull alamellama/mkdocs-publisher:latest
```

### Build Locally

To build the image locally, clone this repository and run:

```bash
docker build -t mkdocs-publisher .
```

### Run the Container

Serve your MkDocs site with the following command:

```bash
docker run -p 8000:8000 -v $(pwd):/app alamellama/mkdocs-publisher
```

- Mount your project directory (with `mkdocs.yml` and `docs/`) to `/app` in the container.
- Access the site at `http://localhost:8000`.

### Example Directory Structure

Ensure your project is structured like this:

```
.
├── docs/
│   ├── index.md
│   └── page1.md
└── mkdocs.yml
```

### Multi-Architecture Support

The Docker image is built with support for multiple platforms:
- `linux/amd64`
- `linux/arm64`

## Contributing 🤝

Contributions are welcome! If you encounter any issues or want to suggest features, feel free to open an issue or submit a pull request.

## License 📄

This project is licensed under the MIT License. See the [LICENSE](https://github.com/ALameLlama/mkdocs-publisher-image/blob/master/LICENSE) file for more details.

---

### About MkDocs

For more information, visit the [MkDocs official website](https://www.mkdocs.org/) and [MkDocs Publisher](https://mkdocs-publisher.github.io/)

Happy documenting! ✍️
