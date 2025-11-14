# Política de infraestructura tecnológica y de comunicaciones

## 1. Situación actual

La infraestructura tecnológica y de comunicaciones de la Oficina de Informática Presupuestaria (OIP) constituye la base sobre la que se sustentan los sistemas de información de la Administración Presupuestaria. Actualmente se dispone de una arquitectura híbrida con servicios desplegados tanto en el entorno del CPD de la IGAE como en infraestructuras de nube pública. El modelo combina servidores físicos, entornos virtualizados, cabinas de almacenamiento en alta disponibilidad, y una red de comunicaciones con redundancia y control de acceso seguro.

Se han modernizado los equipos de red y los firewalls, reforzando la segmentación de tráfico entre entornos internos, DMZ y acceso a Internet. El control de accesos remotos se realiza mediante VPN corporativa, autenticación multifactor y monitorización centralizada. La infraestructura cuenta con herramientas de gestión de inventario, monitorización proactiva, ticketing y registro de incidencias, garantizando la trazabilidad de las actuaciones sobre los sistemas.

En materia de seguridad, se han implantado soluciones de detección y respuesta ante amenazas (EDR), así como medidas de endurecimiento de sistemas, gestión de parches y copias de seguridad automatizadas. Se mantienen políticas de continuidad y recuperación ante desastres, apoyadas en replicación de datos y planes de contingencia probados periódicamente.

## 2. Objetivos y líneas de actuación

Los objetivos estratégicos de la política de infraestructura tecnológica y comunicaciones se centran en asegurar la disponibilidad, integridad y seguridad de los servicios TIC, garantizar su evolución tecnológica y favorecer la eficiencia mediante la automatización y la consolidación de recursos.

Las principales líneas de actuación incluyen:
- Consolidación de infraestructuras en entornos virtualizados y de nube híbrida.
- Implantación de una arquitectura orientada a servicios y de gestión centralizada.
- Incremento de la ciberresiliencia y de las capacidades de detección temprana de incidentes.
- Evolución hacia un puesto de trabajo moderno basado en M365 y servicios cloud seguros.
- Impulso de la automatización de operaciones mediante herramientas de orquestación y scripts de despliegue continuo.
- Refuerzo de la interoperabilidad con los sistemas corporativos de la AGE.

## 3. Comunicaciones y seguridad perimetral

La red de comunicaciones conecta los distintos edificios de la IGAE y sus organismos dependientes mediante enlaces redundantes de alta capacidad. La topología se organiza en niveles core, distribución y acceso, con políticas de segmentación VLAN y control de tráfico entre zonas.

Los sistemas perimetrales incluyen firewalls de nueva generación, proxies de seguridad, balanceadores y dispositivos de inspección de tráfico cifrado. Se aplican políticas de seguridad basadas en listas blancas, control de navegación y filtrado de contenidos. La supervisión se realiza desde una consola unificada que integra alertas y métricas de rendimiento.

Se dispone de sistemas de detección y prevención de intrusiones (IDS/IPS), servicios de DNS seguro y medidas de protección frente a ataques DDoS. Los accesos remotos se canalizan mediante VPN corporativa y autenticación de doble factor. La trazabilidad de eventos se consolida en un sistema de logs centralizado con análisis en tiempo real.

## 4. Infraestructuras y sistemas

Las infraestructuras de servidores combinan entornos físicos y virtualizados. Se emplean hipervisores VMware y almacenamiento en cabinas SAN replicadas entre CPD principales y secundarios. Los sistemas operativos incluyen versiones soportadas de Windows Server y Linux, con actualizaciones controladas y automatizadas.

Los servicios críticos (bases de datos, aplicaciones de gestión, portales, autenticación, etc.) se encuentran desplegados en configuraciones de alta disponibilidad, balanceo de carga y redundancia geográfica. Los backups se realizan de forma diaria y se replican externamente con retención escalonada.

La monitorización se apoya en herramientas como Nagios y Zabbix, y la gestión de incidencias se canaliza a través del sistema de ticketing corporativo. La infraestructura dispone de políticas de mantenimiento preventivo, revisiones periódicas de capacidad y controles de vulnerabilidad.

## 5. Microinformática y puesto de usuario

El parque de microinformática está formado por equipos portátiles y de sobremesa estandarizados, gestionados de forma centralizada mediante herramientas de inventario, actualizaciones y soporte remoto. Se promueve un modelo de puesto de usuario moderno (Modern Workplace), con integración de M365 y políticas de seguridad de dispositivo.

El soporte se articula mediante un sistema de atención a usuarios con gestión de incidencias, solicitudes y cambios. Los equipos incluyen soluciones EDR, cifrado de disco y control de periféricos. La conectividad se apoya en redes cableadas y Wi-Fi seguras con autenticación 802.1X.

En el ámbito de telefonía, se está migrando progresivamente a sistemas de voz sobre IP y herramientas colaborativas integradas con Teams, mejorando la flexibilidad del puesto de trabajo.

## 6. Plataformas tecnológicas y nube

Se ha iniciado la adopción de plataformas en la nube para determinados servicios no críticos y para entornos de desarrollo y pruebas. El modelo se basa en una arquitectura híbrida que combina servicios locales y cloud, garantizando la seguridad mediante cifrado, control de identidades y segmentación.

Se utilizan soluciones SaaS corporativas (correo, colaboración, gestión documental) y se estudia la migración de aplicaciones a entornos PaaS e IaaS cuando se justifique por motivos de escalabilidad o eficiencia.

Las políticas de gobierno de la nube establecen criterios de selección de proveedores, cumplimiento del ENS y evaluación de riesgos. La OIP mantiene la soberanía de los datos y la trazabilidad de los servicios mediante auditorías y controles periódicos.

## 7. Administración digital y servicios compartidos

La política de infraestructura tecnológica está alineada con la estrategia de transformación digital de la IGAE y la AGE. Se promueve la integración con plataformas compartidas como Cl@ve, SIR, DIR3, @firma y Notifica.

Se desarrollan actuaciones para automatizar procesos internos y fomentar el uso de herramientas digitales corporativas, impulsando la interoperabilidad con sistemas de gestión presupuestaria, contabilidad y control.

Asimismo, se fomenta la disponibilidad de APIs y servicios reutilizables para otras unidades, facilitando el intercambio seguro de información. El objetivo final es consolidar un entorno digital eficiente, seguro y sostenible que soporte la modernización continua de la Administración Presupuestaria.