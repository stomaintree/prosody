FROM centos:latest
LABEL io.k8s.description="Prosody server" \
      io.k8s.display-name="Prosody" \
      io.openshift.expose-services="5222/tcp:xmpp" \
      io.openshift.tags="xmpp"
EXPOSE 5222
RUN yum -y update && yum -y install prosody && yum clean all -y
ADD example.cfg.lua /etc/prosody/conf.d/example.cfg.lua
CMD ["/usr/bin/prosodyctl start"]
