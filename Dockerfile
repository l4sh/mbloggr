# TODO: we need this to get Python 3 at least 3.4; remove when 21 becomes "the" fedora docker image
FROM fedora:21

WORKDIR /srv
RUN yum -y install python3 && pyvenv "mbloggr"

ADD . /srv/mbloggr/mbloggr
RUN cd "mbloggr" && source bin/activate && pip3 install -r "mbloggr/requirements.txt"


EXPOSE 8000
CMD source /srv/mbloggr/bin/activate && \
 /srv/mbloggr/mbloggr/manage.py runserver 0.0.0.0:8000
