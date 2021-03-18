ARG BASE_REPO
ARG BASE_TAG

# The base image is passed in from the Makefile
FROM $BASE_REPO:$BASE_TAG

# # Install packages for this project here
# RUN apt-get update \
#   && apt-get install --yes --no-install-recommends \
#     ...
#   && echo "Workspace package(s) installed."

# # For quick package testing without re-installing above packages
# # Important: move to above block after testing!
# RUN apt-get update \
#   && apt-get install --yes --no-install-recommends \
#     ...
#   && echo "Development package(s) installed."

WORKDIR /workspace
