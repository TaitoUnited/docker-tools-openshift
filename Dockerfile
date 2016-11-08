FROM debian:sid

ENV HOME=/opt/app-root

RUN mkdir -p ${HOME} && \
    chown -R 1001:0 ${HOME} && \
    chmod -R ug+rwx ${HOME} && \
    apt-get update && \
    apt-get install -y sqitch postgresql-client && \
    apt-get clean && \
    sqitch config --user user.name "Taito United Openshift" && \
    sqitch config --user user.email "support@taitounited.fi"

USER 1001

WORKDIR ${HOME}
