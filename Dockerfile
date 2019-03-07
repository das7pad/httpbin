FROM python:3

LABEL name="httpbin"
LABEL description="A simple HTTP service."
LABEL org.kennethreitz.vendor="Kenneth Reitz"

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ADD requirements.txt requirements.docker.txt /httpbin/
RUN pip3 install --no-cache-dir --requirement /httpbin/requirements.docker.txt

ADD . /httpbin
RUN pip3 install --no-cache-dir /httpbin

EXPOSE 8080
CMD ["gunicorn", "-b", "0.0.0.0:8080", "httpbin:app", "-k", "gevent"]
USER nobody

LABEL version="0.9.3+das7pad"
