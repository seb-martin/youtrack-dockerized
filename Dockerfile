FROM dockerfile/java:oracle-java8

MAINTAINER Sébastien Martin <seb.martin.94@gmail.com>

RUN wget https://download.jetbrains.com/charisma/youtrack-6.5.17105.jar -O youtrack.jar

EXPOSE 80

CMD ["java", "-XX:MaxMetaspaceSize=250m", "-Xmx1g", "-Djava.awt.headless=true", "-jar", "youtrack.jar", "80"]
