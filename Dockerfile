#  Copyright 2019 IBM
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

FROM php:apache

# Support to for arbitrary UserIds
# https://docs.openshift.com/container-platform/3.11/creating_images/guidelines.html#openshift-specific-guidelines
RUN chgrp -R 0 /var/run/apache2 /var/lock/apache2 /var/log/apache2 /var/www/html && \
    chmod -R g=u /var/run/apache2 /var/lock/apache2 /var/log/apache2 /var/www/html /etc/passwd
    
EXPOSE 8080

# change default port to the exposed one for the apache server
RUN sed -i "/^\s*Listen 80/c\Listen 8080" /etc/apache2/ports.conf \
    && sed -i "/^\s*<VirtualHost \*:80>/c\<VirtualHost \*:8080>" /etc/apache2/sites-available/000-default.conf

COPY . /var/www/html/
