# Pull base image.
FROM ubuntu:14.04

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

# Make a directory where your files will be stored
RUN mkdir /grader
RUN mkdir /grader/solutions
RUN mkdir /grader/submissions

# Copy submissions files into docker image
COPY submissions/* /grader/submissions/

# Copy solutions and test case into docker image
COPY solutions/* /grader/solutions/

# Copy shell file into docker image
COPY grader.sh /grader/grader.sh

# Copy grader script into docker image
COPY grader.py /grader/grader.py

# Important: Docker images are run without root access on our platforms. Its important to setup permissions accordingly.
# Executable permissions: Required to execute executeGrader.sh
# Read permissions: Required to read needed files
# Write permissions: Required to store the compiled java files
RUN chmod a+rwx -R /grader/

ENTRYPOINT ["./grader/grader.sh"]
