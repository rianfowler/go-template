# Use the official Go image as a base image
FROM golang:1.19

# Install required packages: git, make, zsh, and curl
RUN apt-get update && apt-get install -y \
  git \
  make \
  zsh \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Install cobra-cli for scaffolding CLI applications
RUN go install github.com/spf13/cobra-cli@latest

# Install Oh My Zsh non-interactively
ENV RUNZSH=no \
  CHSH=no
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set the working directory inside the container
WORKDIR /workspace

# (Optional) Create and use a non-root user for a safer environment
RUN adduser --disabled-password --gecos '' devuser
USER devuser
