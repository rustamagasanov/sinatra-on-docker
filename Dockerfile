# Don't use latest, lock down to specific version
FROM phusion/passenger-ruby22:0.9.15

# Remove default nginx app
RUN rm /etc/nginx/sites-enabled/default
# Add my app's nginx config
ADD nginx.conf /etc/nginx/sites-enabled/nginx.conf
# Enable nginx and passenger
RUN rm -f /etc/service/nginx/down

RUN mkdir /home/app/webapp
WORKDIR /home/app/webapp

# Improvement to use docker's cache and don't run bundle intall if nothing changed
ADD Gemfile /home/app/webapp/Gemfile
ADD Gemfile.lock /home/app/webapp/Gemfile.lock
RUN bundle install --deployment

ADD . /home/app/webapp

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]
EXPOSE 80
