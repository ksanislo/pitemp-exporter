FROM python:3.7
EXPOSE 9546
RUN groupadd --gid 5001 pitemp-exporter && useradd --no-log-init --no-create-home --home-dir /usr/src/pitemp-exporter --uid 5001 --gid 5001 --shell /bin/false pitemp-exporter
RUN mkdir -p /usr/src/pitemp-exporter && chown pitemp-exporter:pitemp-exporter /usr/src/pitemp-exporter
RUN mkdir -p /var/log/pitemp-exporter && chown pitemp-exporter:pitemp-exporter /var/log/pitemp-exporter
WORKDIR /usr/src/pitemp-exporter
RUN pip install dumb-init
ENTRYPOINT ["dumb-init", "--"]
CMD ["bash", "/usr/src/pitemp-exporter/startup.sh"]
COPY --chown=pitemp-exporter:pitemp-exporter startup.sh /usr/src/pitemp-exporter/
COPY --chown=pitemp-exporter:pitemp-exporter pitemp-exporter /usr/src/pitemp-exporter/
RUN python -OO -m py_compile pitemp-exporter
