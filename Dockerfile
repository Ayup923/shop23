FROM ubuntu

WORKDIR /

COPY . .

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt install -y python3-pip 
RUN pip install --upgrade pip
RUN pip install wheel gunicorn
RUN pip install -r req.txt

ENV SECRET_KEY=_z0sln3en!%jahmk+=3$!@x$^0091-bo+fh3!kuf8ia_ap*o0u
ENV DB_NAME=railway
ENV DB_USER=postgres
ENV DB_PASSWORD=1eslLk2czHvIKAecqf1V
ENV DB_HOST=containers-us-west-29.railway.app
ENV DB_PORT=5890
ENV DEBUG=1
ENV ALLOWED_HOSTS=0.0.0.0,127.0.0.1,shop23-production.up.railway.app
ENV PORT=8000
RUN python3 manage.py collectstatic

CMD gunicorn --bind 0.0.0.0:$PORT config.wsgi:application

