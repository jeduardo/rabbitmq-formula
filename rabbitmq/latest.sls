include:
  - rabbitmq

{% if grains['os_family'] == 'Debian' %}
rabbitmq_repo:
  pkgrepo.managed:
    - humanname: RabbitMQ Repository
    - name: deb http://www.rabbitmq.com/debian/ testing main
    - file: /etc/apt/sources.list.d/rabbitmq.list
    - key_url: https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
    - require_in:
      - pkg: rabbitmq-server
{% elif grains['osfinger'] == 'CentOS Linux-6' %}
rabbitmq_repo:
  pkgrepo.managed:
    - humanname: RabbitMQ Packagecloud Repository
    - baseurl: https://packagecloud.io/rabbitmq/rabbitmq-server/el/6/$basearch
    - gpgcheck: 1
    - enabled: True
    - gpgkey: https://packagecloud.io/gpg.key
    - sslverify: 1
    - sslcacert: /etc/pki/tls/certs/ca-bundle.crt
    - require_in:
      - pkg: rabbitmq-server
{% elif grains['osfinger'] == 'CentOS Linux-7' %}
rabbitmq_repo:
  pkgrepo.managed:
    - humanname: RabbitMQ Packagecloud Repository
    - baseurl: https://packagecloud.io/rabbitmq/rabbitmq-server/el/7/$basearch
    - gpgcheck: 1
    - enabled: True
    - gpgkey: https://packagecloud.io/gpg.key
    - sslverify: 1
    - sslcacert: /etc/pki/tls/certs/ca-bundle.crt
    - require_in:
      - pkg: rabbitmq-server
{% endif %}
