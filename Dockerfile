FROM	ubuntu

RUN	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y python git python-setuptools curl
RUN	apt-get upgrade -y

RUN	curl https://bootstrap.pypa.io/ez_setup.py -o - | python

RUN	cd /root && git clone https://github.com/Yelp/elastalert.git
RUN	cd /root/elastalert/ && python setup.py install
ADD ./config.yaml /root/elastalert/config.yaml
RUN	mkdir /root/elastalert/rules
ADD ./rules /root/elastalert/rules
