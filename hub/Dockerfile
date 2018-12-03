FROM jupyterhub/jupyterhub

RUN pip install dockerspawner jupyterhub-ldapauthenticator notebook

COPY ./startup.sh /srv/jupyterhub/startup.sh
COPY ./permmit.sh /srv/jupyterhub/permmit.sh
RUN chmod +x /srv/jupyterhub/permmit.sh
RUN chmod +x /srv/jupyterhub/startup.sh

COPY ./jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

CMD ["./startup.sh"]
