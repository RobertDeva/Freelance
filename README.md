# Torque AI — Demo de agente para taller automotriz

Demo web interactiva para mostrar cómo un asistente de operaciones podría ayudar a un taller con:
- **Agenda de citas:** registrar solicitudes, buscar y filtrar citas, cambiar estados y detectar conflictos de fecha/hora.
- **Reseñas:** ver opiniones de ejemplo, revisar respuestas sugeridas y preparar un borrador de seguimiento.
- **Atención al cliente:** bandeja de conversaciones ficticias, respuestas rápidas para precios, horarios, estado del vehículo y garantía.
- **Panel operativo:** resumen de citas, pendientes, reseñas y acciones sugeridas.

## Probar
Abre `index.html` en un navegador moderno. No requiere npm, compilación, dependencias, CDN ni servicios externos. La interfaz se adapta a móvil y escritorio.

## Publicar con GitHub Pages
1. En el repositorio, abre **Settings → Pages**.
2. Selecciona **Deploy from a branch**.
3. Elige `main` y la carpeta `/(root)`, y guarda.
4. La URL normalmente tendrá la forma `https://robertdeva.github.io/Freelance/` (puede tardar unos minutos en activarse).

## Límites de esta demostración
- Torque AI y el taller son conceptos ficticios. Todos los nombres, reseñas, horarios y datos de clientes son inventados.
- Las citas y conversaciones que agregues se guardan únicamente en el almacenamiento local del navegador en el que estás probando la demo.
- No se envían SMS, correo, WhatsApp, mensajes de reseña ni confirmaciones de citas.
- No hay integración con Google Calendar, CRM, software de taller, Google Business Profile ni una API de IA.
- Las respuestas sugeridas son reglas de ejemplo en JavaScript, no un modelo de IA real. El botón “Ejecutar revisión” realiza comprobaciones locales básicas.
- Antes de usarlo con un negocio real harían falta autenticación, base de datos segura, permisos por usuario, integración autorizada con calendario y canales de mensajería, manejo de consentimiento, registro de auditoría, protección de datos y aprobación humana para acciones sensibles.

## Tecnologías
HTML, CSS y JavaScript vanilla. Sin paquetes ni recursos externos.
