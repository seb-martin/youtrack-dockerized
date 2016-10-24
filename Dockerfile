FROM java:8-jre

MAINTAINER Sébastien Martin <seb.martin.94@gmail.com>

ENV YOUTRACK_HOME /var/lib/youtrack

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

ARG user=youtrack
ARG group=youtrack
ARG uid=1000
ARG gid=1000

# Youtrack is run with user `youtrack`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$YOUTRACK_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user} \
    && chown -R ${user} "$YOUTRACK_HOME"

VOLUME ${YOUTRACK_HOME}

# Youtrack version and build numbers being bundled in this docker image
ARG YOUTRACK_VERSION
ENV YOUTRACK_VERSION ${YOUTRACK_VERSION:-7.0.27705}

# youtrack.war checksum, download will be validated using it
ARG YOUTRACK_SHA256=2faf0ffe60f92bd4bd22c6ac0a3399b83f4936e765dfdbec3494d9b4e21cb534

# Can be used to customize where youtrack.war get downloaded from
ARG YOUTRACK_URL=https://download.jetbrains.com/charisma/youtrack-${YOUTRACK_VERSION}.jar

RUN curl -fsSL ${YOUTRACK_URL} --create-dirs -o /usr/share/youtrack/youtrack-${YOUTRACK_VERSION}.jar \
  && echo "${YOUTRACK_SHA256}  /usr/share/youtrack/youtrack-${YOUTRACK_VERSION}.jar" | sha256sum -c -

ARG JAVA_OPTS
ENV JAVA_OPTS ${JAVA_OPTS:-"-Xmx1g -XX:MaxMetaspaceSize=250m -Djava.awt.headless=true -Djetbrains.youtrack.disableBrowser=true"}

COPY entrypoint.sh /usr/local/bin/youtrack.sh
RUN chmod -R a+x /usr/local/bin/youtrack.sh /usr/share/youtrack/

EXPOSE 8080

USER ${user}

ENTRYPOINT ["/usr/local/bin/youtrack.sh"]
