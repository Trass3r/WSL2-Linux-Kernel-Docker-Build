# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.134.1/containers/ubuntu/.devcontainer/base.Dockerfile
ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN	apt update && apt upgrade -y

# gcc is referenced directly, so use build-essential
RUN	apt install -y --no-install-recommends \
	build-essential g++-8 \
	flex bison \
	libbabeltrace-ctf-dev \
	systemtap-sdt-dev \
	libslang2-dev \
	libelf-dev \
	libunwind-dev \
	libdw-dev \
	libiberty-dev
