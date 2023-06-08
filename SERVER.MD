## Configuracion de ambiente stage-dev

# SO

El servidor esta corriendo una instalacion de Ubuntu Server 22.04, con las funcionalidades de docker y ssh agregadas al principio. Para poder acceder por medio de ssh debe encontrarse en la misma red privada o ser accesible desde internet.

## Configuraciones

### docker
El usuario que se va a utilizar, en mi caso vriera-server debe ser agregado al group de docker por medio de un root.

```
sudo groupadd docker
sudo usermod -aG docker $USER
```

### SSH

Agregar al archivo en .ssh/authorized_keys la firma publica generada por las credenciales configuradas en el jenkins


## Seteo para utilizar como ambiente

### Scripts

De este repositorio se debe copiar el contenido de la carpeta /scripts al siguiente path: $HOME/redes

