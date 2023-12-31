ARG BUILD_ARCH
FROM homeassistant/${BUILD_ARCH}-base-debian

RUN apt-get update; apt-get install -y wget apt-transport-https

RUN mkdir -p /etc/apt/keyrings

RUN wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc

RUN echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list

RUN apt update; apt install -y temurin-17-jdk

# Copy data for add-on
ADD Release ./Release
COPY run.sh ./
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]