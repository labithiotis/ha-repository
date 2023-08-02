ARG BUILD_FROM
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_VERSION
ARG N8N_VERSION

FROM $BUILD_FROM:${N8N_VERSION}

RUN echo n8n version ${N8N_VERSION}
RUN echo build version ${BUILD_VERSION}

USER root
RUN apk add --no-cache --update jq bash
USER node

WORKDIR /data

COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh

ENTRYPOINT ["bash", "/tmp/docker-entrypoint.sh"]

EXPOSE 5678/tcp

LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION}
