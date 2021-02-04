ARG docker_registry=docker.io/vinothmohan
ARG image_tag=latest

FROM ${docker_registry}/base-workspace:${image_tag}

USER root

COPY supervisord-codeserver.conf /etc/supervisord/
COPY ./mkdocs/helpers.py /home/docs/macros
COPY ./mkdocs/home.md /home/docs/docs/pages/home/
COPY ./mkdocs/IDE.jpg /home/docs/docs/pages/home/home/
COPY README.md /home/docs/docs/docs.md

RUN echo "------------------------------------------------------ code-server" \
	&& mkdir -p -m 777 /opt/codeserver \
	&& cd /opt/codeserver && nodeenv --node=12.18.3 --npm=6.0.0 env \
	&& cd /opt/codeserver && . env/bin/activate &&  npm install -g --unsafe-perm code-server@3.10.2 \
	&& mkdir -p -m 777 /home/project \
	&& mkdir -p -m 777 /opt/codeserver/data \
	&& mkdir -p -m 777 /opt/codeserver/extensions \ 
	&& mkdir -p -m 777 /var/log/codeserver \
	&& echo "------------------------------------------------------ user" \
	&& chown -R abc /home/project \
	&& chown -R abc /opt/codeserver \
	&& chown -R abc /opt/codeserver/data \
	&& chown -R abc /opt/codeserver/extensions \
    && chown -R abc /home/docs \
    && chown -R abc /home/abc/installed-python-packages \
    && find /home -type d | xargs -I{} chown -R abc {} \
    && find /home -type f | xargs -I{} chown abc {} 



COPY code-server-run.sh /opt/codeserver/code-server-run.sh 