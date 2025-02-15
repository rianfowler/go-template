# Use the official Go image as a base image
FROM golang:1.23

# Install required packages: git, make, zsh, and curl
RUN apt-get update && apt-get install -y \
  git \
  make \
  zsh \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Install cobra-cli for scaffolding CLI applications
RUN go install github.com/spf13/cobra-cli@latest

# Install testing library
RUN go install gotest.tools/gotestsum@latest

# Install Oh My Zsh non-interactively
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set the working directory inside the container
WORKDIR /workspace