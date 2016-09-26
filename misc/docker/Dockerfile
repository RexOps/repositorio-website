FROM jfried/pitahaya:latest

ENV VERSION 0.1.9

EXPOSE 8080

RUN mkdir -p /var/lib/pitahaya/instance1/
RUN cd /var/lib/pitahaya/instance1/ ; git clone https://github.com/RexOps/repositorio-website.git .
RUN cd /var/lib/pitahaya/instance1/ ; git checkout cms
RUN cd /var/lib/pitahaya/instance1/ ; mkdir log
RUN cd /var/lib/pitahaya/instance1/bin ; rm pitahaya ; ln -s /usr/share/pitahaya/bin/pitahaya 

RUN mkdir /cms.init
ADD cms.init/init.sql /cms.init/init.sql
ADD cms.init/01init_db.sh /cms.init/01init_db.sh

RUN chmod 755 /cms.init/01init_db.sh

CMD ["/usr/local/bin/run_pitahaya.sh"]
