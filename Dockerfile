FROM fluentd:v1.14.0-1.0

USER root

RUN apk add --no-cache --update --virtual .build-deps sudo build-base ruby-dev \
 && sudo gem install fluent-plugin-opensearch \
 && sudo gem install fluent-plugin-concat \
 && sudo gem install fluent-plugin-parser \
 && sudo gem sources --clear-all \
 && sudo apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem /home/fluent/.gem/ruby/*/cache/*.gem

