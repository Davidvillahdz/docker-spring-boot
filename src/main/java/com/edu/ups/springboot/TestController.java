package com.edu.ups.springboot;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

@RestController
public class TestController {

    @GetMapping("/")
    public Map<String, String> saludoExamen() {
        Map<String, String> respuesta = new HashMap<>();

        respuesta.put("status", "success");
        respuesta.put("result", "API de Spring Boot corriendo exitosamente en Docker para el examen");
        respuesta.put("estudiante", "Elian David Villa Hernandez");

        return respuesta;
    }
}