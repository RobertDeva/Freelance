# Verificación de cobros antes de aceptar ventas

**Estado: pendiente de confirmación por escrito.** Tener una cuenta empresarial de QvaPay y poder recibir criptomonedas no garantiza que todas las operaciones de entrada, conversión y retirada estén disponibles desde la residencia y categoría de negocio actuales.

## 1. QvaPay empresarial

La documentación oficial consultada el 24 de octubre de 2026 describe la API de comerciantes, facturas con enlaces compartibles y webhooks. También informa de cambios recientes en los flujos internacionales de empresas cubanas.

Fuentes oficiales:
- API docs: https://www.qvapay.com/docs
- Crear factura: https://www.qvapay.com/docs/merchants/create-invoice
- Flujos de fondos permitidos: https://www.qvapay.com/fund-flows
- Transparencia y cumplimiento: https://www.qvapay.com/transparency

Antes de usar QvaPay para cobrar a clientes, pedir soporte una respuesta escrita y específica para la cuenta empresarial del usuario. Preguntar:
1. ¿La categoría actual de la cuenta empresarial y el perfil de residencia permiten vender servicios digitales a clientes internacionales?
2. ¿Puede la cuenta recibir cobros de clientes de Estados Unidos y Latinoamérica para desarrollo web/servicios digitales?
3. ¿Qué monedas y redes se admiten actualmente para recibir esos pagos?
4. ¿Qué saldo resultará acreditado y qué comisiones se aplican?
5. ¿Qué métodos de retirada están disponibles para esta cuenta y residencia?
6. ¿Están habilitadas actualmente las retiradas internacionales de esta categoría de empresa, considerando los cambios anunciados para el 30 de septiembre de 2026?
7. ¿Qué documentos, KYC, licencias, comprobantes de servicio y condiciones fiscales exige QvaPay?
8. ¿Qué ocurre con disputas, devoluciones, pagos erróneos y retenciones de cumplimiento?

No enviar claves API, códigos de verificación, PIN, frase semilla ni contraseñas al soporte o a este repositorio. No publicar credenciales en GitHub.

## 2. Cobros directos en criptomonedas

Antes de anunciar una moneda:
- Elegir solo una moneda y red que ambas partes puedan usar.
- Confirmar que el cliente puede enviar y el negocio puede recibir desde una billetera propia.
- Confirmar comisiones de red, mínimo de transferencia, confirmaciones y tratamiento de pagos insuficientes/excesivos.
- Confirmar cómo convertir, conservar o utilizar el activo sin infringir términos de proveedores ni reglas aplicables.
- Definir precio, activo aceptado, red, dirección verificada, plazo de pago, política de devolución y qué ocurre si se envía por una red incorrecta.
- Probar primero con un importe pequeño propio solo después de revisar las condiciones y los riesgos.
- Nunca compartir claves privadas o frases semilla. Verificar la dirección por un segundo canal antes de aceptar un pago.

Una transacción en blockchain puede ser irreversible. No describirla como un método de devolución sencilla.

## 3. Criterio de autorización comercial

Marcar cada punto como confirmado, no confirmado o no aplicable:
- [ ] La plataforma admite mi categoría de negocio y residencia.
- [ ] El cliente objetivo puede pagar desde su país.
- [ ] Puedo retirar o usar legalmente los fondos.
- [ ] Conozco comisiones, límites y plazos.
- [ ] Sé cómo gestionar reembolsos y errores.
- [ ] Puedo conservar registros de pedidos y pagos.
- [ ] Las obligaciones legales y fiscales están identificadas.

**No anunciar el método como disponible si algún punto esencial está sin confirmar.** Mientras se verifica, se puede prospectar, presentar demos, preparar propuestas no vinculantes y definir el alcance, indicando que el método de pago se confirma antes de contratar.

## 4. Implementación técnica futura

Para QvaPay, la guía oficial describe `POST /v2/create_invoice` autenticado con `app-id` y `app-secret`, y una URL de pago que puede compartirse con el cliente. El secreto debe guardarse únicamente en un backend o entorno seguro. La entrega del servicio solo debe activarse tras verificar el pago mediante una notificación autenticada o consulta server-side; no basta con que el navegador regrese a una página de éxito.

No implementar pagos reales en el frontend estático. Primero validar compatibilidad comercial, después seleccionar un backend gratuito que sea accesible y fiable para la situación del usuario.
