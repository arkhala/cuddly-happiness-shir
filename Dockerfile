FROM alpine:3.23

ARG VERSION=d399071

RUN apk add --no-cache ca-certificates curl && \
    curl -fsSL -o /usr/local/bin/conduit "https://github.com/ssmirr/conduit/releases/download/${VERSION}/conduit-linux-amd64" && \
    chmod +x /usr/local/bin/conduit && \
    apk del curl

# Shir o Khorshid enabled by default
ENTRYPOINT ["/bin/sh", "-c", "exec conduit start -b \"${BANDWIDTH:-50}\" -m \"${MAXCLIENTS:-80}\" ${COMPARTMENT:+--compartment \"${COMPARTMENT}\"} ${METRICSADDRESS:+--metrics-addr \"${METRICSADDRESS}\"} ${SET:+${SET}}"]

ENV COMPARTMENT=shirokhorshid \
    BANDWIDTH=-1 \
    MAXCLIENTS=100 \
    METRICSADDRESS=:9090
