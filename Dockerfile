# 1. IMAGEN BASE DE RUNTIME (LIGERA)
FROM eclipse-temurin:17-jre-jammy

# Configuración del directorio de trabajo interno
WORKDIR /app

# Metadatos del desarrollador
LABEL autor="David Villa Hernandez" \
      descripcion="Template base optimizado de Spring Boot para examen de Sistemas Distribuidos"

# Configuración de variables para optimizar los logs de Java en tiempo real
ENV PYTHONUNBUFFERED=1

# 2. SEGURIDAD (USUARIO NO-ROOT CON PERMISOS DE ESCRITURA)
RUN useradd -u 1000 -m springuser && \
    mkdir -p /app/data && \
    chown -R springuser:springuser /app

# 3. TRANSFERENCIA DEL COMPILADO JAR
# Copiamos el binario generado por Maven desde la carpeta target local
COPY --chown=springuser:springuser build/libs/*.jar app.jar

# Cambiamos explícitamente al contexto del usuario seguro sin privilegios
USER springuser

# Spring Boot expone por defecto el puerto 8080
EXPOSE 8080

# Comando ejecutable inmutable para arrancar la máquina virtual de Java (JVM)
CMD ["java", "-jar", "app.jar"]