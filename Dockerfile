FROM alpine:3.23

LABEL maintainer="Arkhala"
LABEL description="Minimal Docker image for Psiphon Conduit (ssmirr community fork) - Shir o Khorshid edition"

# Latest ssmirr/conduit (commit tag - update when new releases come)
ARG VERSION=e421eff

RUN apk add --no-cache ca-certificates curl && \
    curl -fsSL -o /usr/local/bin/conduit \
    "https://github.com/ssmirr/conduit/releases/download/${VERSION}/conduit-linux-amd64" && \
    chmod +x /usr/local/bin/conduit && \
    apk del curl

ENTRYPOINT ["/bin/sh", "-c", \
    "exec conduit start -b \"${BANDWIDTH:-50}\" -m \"${MAXCLIENTS:-80}\" \
    ${COMPARTMENT:+--compartment \"${COMPARTMENT}\"} \
    ${METRICSADDRESS:+--metrics-addr \"${METRICSADDRESS}\"} \
    ${SET:+${SET}}"]

ENV COMPARTMENT=shirokhorshid \
    BANDWIDTH=50 \
    MAXCLIENTS=80