FROM fvigotti/docker-fatjdk8

ADD https://github.com/scobal/seyren/releases/download/1.2.1/seyren-1.2.1.jar /opt/seyren.jar
ADD run-seyren.sh /usr/bin/run-seyren.sh
RUN chmod +x /usr/bin/run-seyren.sh

ENTRYPOINT ["/usr/bin/run-seyren.sh"]
EXPOSE 8080

