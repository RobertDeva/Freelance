# Arquitectura compartida — Torque AI + Glow Desk

Esta carpeta documenta la arquitectura compartida de los agentes. El frontend permanece en HTML, CSS y JavaScript vanilla.

## Modo sin coste
El endpoint puede funcionar inicialmente con respuestas por reglas, sin API de IA pagada. Un modelo generativo local requiere ejecutar un servidor de modelo; un servicio alojado gratuito puede tener límites y cambiar sus condiciones.

## Estado de la integración
El esquema y las funciones backend deben desplegarse en un proyecto Supabase dedicado. No se debe reutilizar el proyecto de Universo Geek. La organización actual alcanzó el límite de dos proyectos gratuitos activos, por lo que la implementación en la nube queda pendiente de liberar un espacio o seleccionar otro alojamiento.

## Seguridad
Nunca incluyas claves privadas de proveedores, tokens de WhatsApp ni claves privilegiadas en el navegador. WhatsApp requiere configurar y verificar la app de Meta; las reseñas no se publican automáticamente. Las citas no deben darse por confirmadas hasta que la base de datos valide la disponibilidad.
