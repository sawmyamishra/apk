FROM ubuntu

ENV TZ=Asia

ADD smsdemo.apk ./smsdemo.apk
ADD sample.apk ./sample.apk
ADD dex2jar-2.0.zip ./dex2jar-2.0.zip
ADD jd-cli.jar ./jd-cli.jar


RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install zip -y && \
    apt-get install wget -y && \
    apt-get install apktool -y && \
    apt-get install apache2 -y && \
    apt-get install nginx -y && \
    apt-get clean

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]    
