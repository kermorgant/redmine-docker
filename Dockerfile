FROM redmine:3.3
MAINTAINER Mikael Kermorgant <mikael@kgtech.fi>

ENV REFRESHED_AT  2016-12-05

ADD https://raw.githubusercontent.com/kermorgant/docker-tools/master/lib/dblib.sh /opt/kgtech/dblib.sh
ADD https://raw.githubusercontent.com/kermorgant/docker-tools/master/bin/wait-for-it.sh /usr/local/bin/wait-for-it.sh
COPY entrypoint.sh /
ADD templates/configuration.tmpl /usr/src/redmine/config/

RUN chmod +x /entrypoint.sh /usr/local/bin/wait-for-it.sh


ENTRYPOINT ["/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
