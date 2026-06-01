# Guía de Despliegue: Spring Boot + Docker

Este proyecto sirve como una referencia práctica para ejecutar una aplicación Spring Boot dentro de un contenedor Docker de forma sencilla.

---

##  Flujo de trabajo

### 1. Generar el archivo .jar

Primero se debe compilar la aplicación:

```
./gradlew clean bootJar
```

Esto genera el archivo `.jar` en:

```
build/libs/
```

---

### 2. Construir la imagen Docker

```
docker build -t davidvilla7/springboot-template:1.0.0 .
```

---

### 3. Ejecutar el contenedor

```
docker run -d --name app_spring -p 8080:8080 davidvilla7/springboot-template:1.0.0
```

Acceso:

```
http://localhost:8080
```

---

### 4. Comandos útiles

```
docker logs app_spring
docker stop app_spring
docker start app_spring
docker restart app_spring
```

---

#  Cómo crear el Dockerfile desde cero
##  Idea clave

Un Dockerfile siempre sigue esta lógica:

1. Imagen base
2. Directorio de trabajo
3. Copiar archivos
4. Ejecutar la app

---

##  Dockerfile básico para Spring Boot

Crear un archivo llamado **Dockerfile** (sin extensión):

```
FROM openjdk:17-jdk-slim

WORKDIR /app

COPY build/libs/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
```

---

##  Cómo pensarlo 
 recuerda:

* Spring → usa Java
* Java → ejecuta `.jar`
* Docker → necesita copiar y ejecutar

 Traducción mental:

> “Uso Java, copio el jar y lo ejecuto”

---

##  Errores comunes en Dockerfile

* No generar el `.jar`
* Nombre incorrecto del archivo
* Olvidar `COPY`
* Escribir mal el `CMD`
* Puerto incorrecto

---

#  Cómo crear el .dockerignore

##  ¿Para qué sirve?

Evita copiar archivos innecesarios dentro de la imagen Docker.

 Hace la imagen más ligera y rápida

---

##  Crear archivo

Crear un archivo llamado:

```
.dockerignore
```

---

## Contenido recomendado

```
build/
.git
.gitignore
node_modules/
*.log
*.class
```

---

##  Cómo pensarlo 
 “¿Qué NO necesito dentro del contenedor?”

* código temporal
* archivos compilados innecesarios
* historial de git

---

#  Conceptos importantes

### Imagen base

Se usa Java optimizado para ejecutar la aplicación.

### Usuario no-root

Se puede usar un usuario sin permisos para mayor seguridad.

### Copia del .jar

Se estandariza como `app.jar` para facilitar ejecución.

---

##  Errores comunes

* No generar el `.jar`
* Puerto incorrecto (8080)
* Problemas de permisos
* No copiar correctamente el archivo

---

##  Objetivo

Este proyecto permite:

* Practicar Docker con Spring Boot
* Entender cómo crear un Dockerfile desde cero
* Tener una guía rápida para el examen

---
