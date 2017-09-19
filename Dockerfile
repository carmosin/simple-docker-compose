FROM ubuntu:latest
USER root

RUN apt-get -y update && apt-get -y install build-essential libssl-dev libffi-dev python-dev && apt-get -y install python-pip openssl wget locales
RUN pip install -U pip
RUN pip install -U robotframework
RUN pip install -U robotframework-selenium2library
RUN pip install -U robotframework-extendedselenium2library
RUN pip install -U robotframework-imaplibrary
RUN pip install -U robotframework-httplibrary
RUN pip install -U requests
RUN pip install -U pycrypto
RUN pip install -U paramiko
RUN pip install -U robotframework-requests
RUN pip install -U robotframework-sshlibrary
RUN pip install -U robotframework-rammbock
RUN pip install -U robotframework-ftplibrary
RUN pip install -U robotframework-faker
RUN pip install -U robotframework-difflibrary
RUN pip install -U robotframework-databaselibrary
RUN pip install -U robotframework-archivelibrary
RUN pip install -U robotframework-anywherelibrary
RUN pip install -U robotframework-pabot
RUN pip install -U pymysql
RUN pip install -U xlutils
RUN pip install -U awscli

# Setting up the locale to support UTF-8
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

#Set PYTHONPATH
ENV PYTHONPATH $PYTHONPATH:lib/
CMD robot -d /robot-results/ /tests/${TEST_FILE}
