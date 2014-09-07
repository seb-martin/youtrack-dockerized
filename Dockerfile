<<<<<<< HEAD
FROM dockerfile/java:oracle-java8

MAINTAINER Sébastien Martin <seb.martin.94@gmail.com>

WORKDIR /usr/local

RUN wget http://www.sonatype.org/downloads/nexus-2.9.1-bundle.tar.gz -O nexus-bundle.tar.gz &&\
 tar xvzf nexus-bundle.tar.gz &&\
 rm -f nexus-bundle.tar.gz &&\
 ln -s nexus-2.9.1* nexus

WORKDIR /usr/local/nexus

RUN sed -i 's/#RUN_AS_USER=/RUN_AS_USER=root/' ./bin/nexus

ADD ./conf/nexus.properties /usr/local/nexus/conf/nexus.properties

EXPOSE 80

CMD ["./bin/nexus", "console"]
=======
FROM dockerfile/java:oracle-java8

MAINTAINER Sébastien Martin <seb.martin.94@gmail.com>

RUN wget http://download.jetbrains.com/charisma/youtrack-5.2.5-8823.jar -O youtrack.jar

EXPOSE 80

CMD ["java", "-Xmx512m", "-Djava.awt.headless=true", "-jar", "youtrack.jar", "80"]
>>>>>>> a78f108f4f308092fdfc5da400469aed294e9b74
