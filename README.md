# MkDocs Publisher Docker Image 🚀

<p style="text-align: center;">
<a href="https://github.com/druppelt/mkdocs-publisher-image/actions/workflows/docker-publish.yml"><img src="https://img.shields.io/github/actions/workflow/status/druppelt/mkdocs-publisher-image/.github/workflows/docker-publish.yml" alt="Build"></a>
<a href="https://hub.docker.com/r/druppelt/mkdocs-publisher"><img alt="Docker Image Version" src="https://img.shields.io/docker/v/druppelt/mkdocs-publisher"></a>
<a href="https://hub.docker.com/r/druppelt/mkdocs-publisher"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/druppelt/mkdocs-publisher"></a>
<a href="https://hub.docker.com/r/druppelt/mkdocs-publisher"><img alt="Docker Image Size (tag)" src="https://img.shields.io/docker/image-size/druppelt/mkdocs-publisher/latest"></a>
<a href="https://github.com/druppelt/mkdocs-publisher-image/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License"></a>
</p>

> [!NOTE]
> This is a fork. The original image directly serves the site via nginx, while this image just syncs the result to a specific dir, which you then can mount to your own webservers document root.

This repository contains a Dockerized version of `MkDocs`, a static site generator for project documentation, and the `mkdocs-publisher` plugin for enhanced publishing capabilities. The Docker image is designed to simplify hosting and serving MkDocs-based documentation sites with automatic rebuilds.

## Features ✨

- **MkDocs Pre-installed**: A fast, easy-to-use static site generator.
- **MkDocs Publisher Plugin**: Adds advanced publishing functionality.
- **Automatic Rebuilds**: Watch for file changes and rebuild the site automatically.
- **Lightweight Image**: Based on the official Python alpine image.
- **Multi-Architecture Support**: Built for both `amd64` and `arm64`.

## Usage 🛠️

### Pull the Docker Image

Pull the pre-built image from Docker Hub:

```bash
docker pull druppelt/mkdocs-publisher:latest
```

### Build Locally

To build the image locally, clone this repository and run:

```bash
docker build -t mkdocs-publisher .
```

### Run the Container

Compile your MkDocs site with the following command:

```bash
docker run -v $(pwd):/app -v /var/www:/www druppelt/mkdocs-publisher
```

- Mount your project directory (with `mkdocs.yml` and `docs/`) to `/app` in the container.
- Mount your webservers document root (e.g. `/var/www`) to `/www` in the container.
- Access the site at `http://<your-server-ip>` (or `http://localhost` if running locally).

### Automatic Rebuilds

The container watches for changes in your project directories docs subfolder (`/app/docs/*`) and rebuilds the MkDocs site whenever a change is detected. This is done using `inotifywait` with a debounce to prevent continuous rebuilds during rapid file changes.

### Example Directory Structure

Ensure your project is structured like this:

```
.
├── docs/
│   ├── index.md
│   └── page1.md
└── mkdocs.yml
```

### Example mkdocs.yml

```
site_name: Llama's Notes
site_url: "https://notes.somecooldomain.au/"
use_directory_urls: false

theme:
  name: material
  icon:
    repo: fontawesome/brands/github
  palette:
    # Palette toggle for light mode
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: deep-purple
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode

    # Palette toggle for dark mode
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: deep-purple
      toggle:
        icon: material/brightness-4
        name: Switch to light mode

plugins:
  - pub-obsidian

markdown_extensions:
  - admonition
  - attr_list
  - md_in_html
  - pymdownx.details
  - pymdownx.superfences
```

### Multi-Architecture Support

The Docker image is built with support for multiple platforms:

- `linux/amd64`
- `linux/arm64`

## Contributing 🤝

Contributions are welcome! If you encounter any issues or want to suggest features, feel free to open an issue or submit a pull request.

## License 📄

This project is licensed under the MIT License. See the [LICENSE](https://github.com/druppelt/mkdocs-publisher-image/blob/master/LICENSE) file for more details.

---

### About MkDocs

For more information, visit the [MkDocs official website](https://www.mkdocs.org/) and [MkDocs Publisher](https://mkdocs-publisher.github.io/)

Happy documenting! ✍️
