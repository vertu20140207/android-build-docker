# Dockerfile for ICS/JB/KK app builds.
FROM openjdk:6

# Install 32-bit libs needed by Android build tools.
RUN apt-get update \
    && apt-get install -y \
        libc6-i386 \
        lib32stdc++6 \
        lib32z1 \
        openjdk-7-jre-headless \
    && useradd -m jenkins \
    && echo "jenkins:builder" | chpasswd \
    && echo done

# Add a RW mount to the user's home and jenkins workspace.
VOLUME /data/jenkins

# Add a RO mount to the Android SDK.
VOLUME /sdk
ENV ANDROID_HOME=/sdk

USER jenkins
CMD /bin/bash
