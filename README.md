# Ejemplo de despliegue automático de una aplicación SPA en S3

## Instalación de dependencias

```sh
npm install
```

## Servidor de pruebas
El archivo `vite.config.js` se ha modificado para que la aplicación se ejecute en el puerto 8080 y pueda ser accesible desde el editor Cloud9.

```sh
npm run dev
```

## Compilación y generación del sitio estático
El sitio se genera en la carpeta `dist`.

```sh
npm run build
```

## Despliegue
Es necesario en primer lugar crear un bucket S3 y a continuación [configurarlo para que se comporte como un sitio web](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteAccessPermissionsReqd.html). Para simplificar la tarea se puede utilizar el script proporcionado:

```sh
./crear_bucket.sh NOMBRE_BUCKET
```

A continuación es necesario modificar el fichero `package.json` previamente y configurar el nombre del bucket S3.


```sh
npm run deploy
```

## Despliegue continuo en GitHub Actions
Se proporciona el archivo `workflow.yml.example` con una plantilla de ejemplo para crear un fichero `.github/workflows/despliegue.yml`. Es necesario configurar los secretos de repositorio para almacenar las credenciales de AWS:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN`