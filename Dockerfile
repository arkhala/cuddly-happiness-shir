FROM alpine:3.23

LABEL maintainer="Arkhala"
LABEL description="Minimal Docker image for Psiphon Conduit (ssmirr community fork) - Shir o Khorshid edition"

# Latest ssmirr/conduit commit as of May 2026 (d8522a8)
ARG VERSION=d8522a8

RUN apk add --no-cache ca-certificates curl && \
    curl -fsSL -o /usr/local/bin/conduit \
    "https://github.com/ssmirr/conduit/releases/download/${VERSION}/conduit-linux-amd64" && \
    chmod +x /usr/local/bin/conduit && \
    apk del curl

# Shir o Khorshid enabled by default via --compartment shirokhorshid
ENTRYPOINT ["/bin/sh", "-c", \
    "exec conduit start -b \"${BANDWIDTH:-50}\" -m \"${MAXCLIENTS:-80}\" \
    ${COMPARTMENT:+--compartment \"${COMPARTMENT}\"} \
    ${METRICSADDRESS:+--metrics-addr \"${METRICSADDRESS}\"} \
    ${SET:+${SET}}"]

ENV COMPARTMENT=shirokhorshid \
    BANDWIDTH=50 \
    MAXCLIENTS=80