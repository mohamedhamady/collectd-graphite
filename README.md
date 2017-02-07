# Collectd/Graphite

Simple project to test monitoring with collected / graphite.

![Alt text](https://github.com/mohamedhamady/collectd-graphite/blob/master/demo.png)

# How to test

### Build test schema

```bash
    git clone https://github.com/mohamedhamady/collectd-graphite.git
    cd collectd-graphite
    ./build.sh
    docker-compose up -d
```

### Start your tests

- Graphite URL: localhost/
- login: mhamady
- password: pass
- [Graphite Rest APIs](https://github.com/brutasse/graphite-api/blob/master/docs/api.rst)
- [Using grafana in graphite]( http://docs.grafana.org/features/datasources/graphite/) - datasource = http://web

Enjoy!

