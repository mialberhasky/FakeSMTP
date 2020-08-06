FROM adoptopenjdk/openjdk8:alpine-slim

ADD http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip /fakeSMTP-latest.zip

RUN apk --update --no-cache add unzip \
    && mkdir -p /output \
    && unzip /fakeSMTP-latest.zip

VOLUME /output

EXPOSE 25

ENTRYPOINT ["java","-jar","/fakeSMTP-2.0.jar","--background", "--output-dir", "/output", "--port", "25", "--start-server"]
