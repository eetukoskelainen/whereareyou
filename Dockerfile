FROM python:2.7-stretch

COPY . /app
WORKDIR /app

RUN pip install cython
RUN pip install -r requirements.txt
RUN python -c "from master import db, load_locations; db.create_all(); load_locations()"

EXPOSE 5000
CMD python master.py