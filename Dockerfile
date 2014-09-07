FROM dockerfile/java:oracle-java8

MAINTAINER Sébastien Martin <seb.martin.94@gmail.com>

RUN wget http://download.jetbrains.com/charisma/youtrack-5.2.5-8823.jar -O youtrack.jar

EXPOSE 80

CMD ["java", "-Xmx512m", "-Djava.awt.headless=true", "-jar", "youtrack.jar", "80"]