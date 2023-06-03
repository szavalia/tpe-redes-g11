# tpe-redes-g11

# Instalacion

## Crear imagen de docker para jenkins

``` sh
docker build -t "myjenkins-blueocean:2.387.3-1" .
```

# Crear volumenes 

```
docker volume create jenkins-data
docker volume create jenkins-docker-certs
```