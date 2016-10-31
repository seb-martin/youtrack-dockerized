FROM java:8-jre

MAINTAINER Sébastien Martin <seb.martin.94@gmail.com>

RUN wget https://download.jetbrains.com/charisma/youtrack-7.0.27965.jar -O youtrack.jar

EXPOSE 80

CMD ["java", "-XX:MaxMetaspaceSize=250m", "-Xmx1g", "-Djava.awt.headless=true", "-jar", "youtrack.jar", "80"]
