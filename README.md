# Freelance Lab — portafolio de tres demos funcionales

Portafolio responsive con tres productos independientes, implementados con HTML, CSS y JavaScript vanilla. No necesita npm, compilación, librerías externas ni CDN.

## Demos
- **Torque AI** (`torque-ai/`): agenda de taller, detección local de solapamientos, cambio de estados, reseñas ficticias con borradores de respuesta, bandeja de conversaciones y respuestas rápidas.
- **Glow Desk / Beauty AI** (`beauty-ai/`): reservas por servicio y profesional, detección de conflictos, estados, CRM ligero derivado de reservas, exportación CSV, respuestas rápidas y seguimiento de reseñas.
- **Café Bruma** (`cafe-bruma/`): menú filtrable, historia, horarios y solicitudes de mesa guardadas localmente.

## Ejecutar
Abre `index.html` en un navegador moderno. Cada demo se abre desde la página principal. No requiere backend.

## Publicación con GitHub Pages
En **Settings → Pages**, selecciona **Deploy from a branch** y `main / (root)` después de revisar y fusionar la rama de desarrollo. URL prevista: `https://robertdeva.github.io/Freelance/`.

## Qué es funcional ahora
- Formularios con validación básica, listados y filtros.
- Persistencia de datos de prueba en localStorage del navegador.
- Cambios de estado, detección de conflictos de agenda y respuestas editables.
- Exportación CSV del listado de clientes de Glow Desk.
- Diseño adaptable a móvil y escritorio, controles accesibles y navegación sin dependencias.

## Límites que no deben confundirse con producción
Los datos se guardan en el navegador actual y no se sincronizan entre dispositivos. Las reseñas, clientes y conversaciones iniciales son ficticios. No se envían correos, SMS, WhatsApp ni solicitudes de reseña; no se modifica Google Calendar ni se consulta Google Business Profile. Las respuestas del agente son reglas y plantillas locales, no un modelo de IA generativa. Para operación real hacen falta backend, autenticación, permisos, base de datos, gestión segura de secretos, consentimiento, registros de auditoría, políticas de privacidad y pruebas de seguridad.

## Próxima fase de integración real
1. API backend con autenticación y roles.
2. Base de datos central para citas, clientes, consentimientos y registros.
3. Integración autorizada con calendario y proveedor de mensajería.
4. Proveedor de IA por servidor (la clave nunca se expone en el navegador), con límites, revisión humana y registro de decisiones.
5. Integraciones autorizadas de reseñas y despliegue con variables de entorno.
