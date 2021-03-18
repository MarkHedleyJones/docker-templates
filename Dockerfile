ARG BASE_REPO
ARG BASE_TAG

# The base image is passed in from the Makefile
FROM $BASE_REPO:$BASE_TAG

# Allow the workspace variable to be used during build
ARG WORKDIR

# Install packages for this project here
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    vim \
  && echo "Workspace package(s) installed."

# Run any configuration or build tasks here

# # For quick package testing without re-installing above packages
# # Important: move to above block after testing!
# RUN apt-get update \
#   && apt-get install --yes --no-install-recommends \
#     ...
#   && echo "Development package(s) installed."

WORKDIR $WORKDIR

# Enable bash history inside this container
ENV HISTFILE=$WORKDIR/.bash_history

# Add a convenient way to build the catkin workspace
RUN echo """alias cm='cd ${WORKDIR} && catkin_make -j$(nproc) && rospack profile && source devel/setup.bash ; cd - > /dev/null'""" >> /root/.bashrc
RUN echo """source /opt/ros/${ROS_DISTRO}/setup.bash""" >> /root/.bashrc
RUN echo """if [[ -f /workspace/devel/setup.bash ]]; then\n\
source /workspace/devel/setup.bash\n\
fi""" >> /root/.bashrc
