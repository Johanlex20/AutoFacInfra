<div align="center">

![Landing AutoFacSigo](docs/img/landing-hero.jpg)

# 🧪 AutoFacSigo

**Plataforma web para un distribuidor B2B de químicos para la industria de alimentos:**
catálogo público con carrito, y panel interno que captura facturas de Siigo de forma automática.

[![Demo en vivo](https://img.shields.io/badge/demo-en%20vivo-008abb?style=for-the-badge&logo=googlechrome&logoColor=white)](https://autofac.faseblu.com)
[![Angular](https://img.shields.io/badge/Angular-22-DD0031?style=for-the-badge&logo=angular&logoColor=white)](https://angular.dev)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)](https://spring.io/projects/spring-boot)
[![Java](https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://openjdk.org)
[![MySQL](https://img.shields.io/badge/MySQL-8-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com)
[![Docker](https://img.shields.io/badge/Docker-compose-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![TailwindCSS](https://img.shields.io/badge/Tailwind-3-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)](https://tailwindcss.com)

[🌐 Ver demo](https://autofac.faseblu.com) · [🔌 API](https://apiautofac.faseblu.com) · [📸 Capturas](#-capturas) · [🚀 Instalación](#-instalación-rápida)

</div>

---

## 🔑 Pruébalo ahora (usuario demo)

Entra al panel interno sin registrarte. El usuario demo es **solo lectura**: puedes recorrer todo el aplicativo, pero no crear, editar ni eliminar nada, y los datos de clientes reales aparecen ocultos.

| | |
|---|---|
| 🌐 **URL** | https://autofac.faseblu.com/admin/login |
| 📧 **Correo** | `demo@autofac.com` |
| 🔒 **Contraseña** | `Demo2026` |

> La restricción la aplica el **servidor** (responde `403` a cualquier escritura), no solo la interfaz.

---

## 💡 Sobre el proyecto

AutoFacSigo nace de un caso real: una empresa que distribuye insumos de limpieza y desinfección a plantas de alimentos, fábricas, catering y restaurantes necesitaba dos cosas en una sola aplicación:

1. **Un sitio público** para mostrar su catálogo y recibir pedidos.
2. **Un panel interno** que evite digitar a mano las facturas que se emiten en **Siigo** (software contable), y que permita revisar el estado del negocio de un vistazo.

El resultado es una aplicación full stack desplegada en un servidor propio con Docker.

## ✨ Funcionalidades

### 🛍️ Sitio público
- 🌟 Landing con secciones: quiénes somos, catálogo, sectores atendidos, documentos y contacto
- 🌟 Catálogo de productos con imágenes, presentaciones y precios
- 🌟 **Carrito de compras**: agregar, cambiar cantidades, quitar y vaciar; se conserva al refrescar la página
- 🌟 Descarga de documentos técnicos (fichas, certificados)
- 🌟 Diseño responsive y animaciones con GSAP

### 📊 Panel interno
- 🌟 **Dashboard** con indicadores (facturas, valor total, promedio) y gráficas: barras por mes, torta por medio de pago, top de clientes
- 🌟 **Captura automática de facturas de Siigo** con Selenium, más sincronización programada (cron)
- 🌟 Registros de facturas con paginación
- 🌟 CRUD de productos con carga de imágenes
- 🌟 Gestión de documentos (subida, vista previa y descarga)
- 🌟 Perfil de usuario con foto y cambio de contraseña

### 🔐 Seguridad
- 🌟 Login con **JWT** (Spring Security, sesión sin estado)
- 🌟 Roles `ADMIN` y `DEMO`: el rol DEMO solo puede leer
- 🌟 Contraseñas con **BCrypt**
- 🌟 Manejo centralizado de excepciones (`@RestControllerAdvice`) y validaciones
- 🌟 CORS restringido a los orígenes autorizados
- 🌟 Credenciales y secretos fuera del código (variables de entorno)

---

## 📸 Capturas

### Sitio público

| Catálogo | Carrito |
|:---:|:---:|
| ![Catálogo](docs/img/landing-catalogo.jpg) | ![Carrito](docs/img/carrito.jpg) |

| Quiénes somos | Sectores que atendemos |
|:---:|:---:|
| ![Nosotros](docs/img/landing-nosotros.jpg) | ![Sectores](docs/img/landing-sectores.jpg) |

<div align="center">

**Versión móvil**

<img src="docs/img/movil.jpg" alt="Versión móvil" width="260" />

</div>

### Panel interno (administrador)

El administrador tiene todas las funciones: crear, editar y eliminar. *(En las capturas, los nombres y NIT de clientes están reemplazados por datos genéricos.)*

![Dashboard](docs/img/admin-dashboard.jpg)

| Gráficas (torta y barras) | Registros de facturas |
|:---:|:---:|
| ![Gráficas](docs/img/admin-graficas.jpg) | ![Registros](docs/img/admin-registros.jpg) |

| Editar factura | Catálogo de productos |
|:---:|:---:|
| ![Editar factura](docs/img/admin-registro-editar.jpg) | ![Productos](docs/img/admin-productos.jpg) |

| Nuevo producto (con imagen) | Documentos |
|:---:|:---:|
| ![Nuevo producto](docs/img/admin-producto-nuevo.jpg) | ![Documentos](docs/img/admin-documentos.jpg) |

| Subir documento | Vista previa de documento |
|:---:|:---:|
| ![Subir documento](docs/img/admin-documento-nuevo.jpg) | ![Vista previa](docs/img/admin-documento-vista.jpg) |

| Perfil y cambio de contraseña | Inicio de sesión |
|:---:|:---:|
| ![Perfil](docs/img/admin-perfil.jpg) | ![Login](docs/img/login.jpg) |

### Modo demostración (solo lectura)

Lo que ve quien entra con el usuario demo: mismo panel, sin botones de escritura, con aviso visible y clientes ocultos.

![Modo demo](docs/img/dashboard-demo.jpg)

---

## 🏗️ Arquitectura

```mermaid
flowchart LR
    U([👤 Usuario]) -->|HTTPS| CF[☁️ Cloudflare Tunnel]
    CF --> FE[🅰️ Angular 22<br/>Nginx :4210]
    CF --> BE[🍃 Spring Boot 3.5<br/>API REST :8090]
    FE -->|JWT| BE
    BE --> DB[(🐬 MySQL 8)]
    BE --> FS[(📁 uploads)]
    BE -->|Selenium + Chromium| SG[🧾 Siigo]
```

**Flujo de captura de facturas:** el backend abre Chromium con un perfil persistente (para que Siigo recuerde el dispositivo), inicia sesión, lee las facturas, las guarda en MySQL y el dashboard las refleja. Corre bajo demanda desde el panel o por cron (configurable, zona horaria `America/Bogota`).

### Estructura del repositorio

```
AutoFacSigo/
├── AutoFac/            # Frontend Angular (landing + panel)
├── AutoFacApi/         # Backend Spring Boot (API REST + Selenium)
├── docker-compose.yml  # MySQL + backend + frontend
└── docs/img/           # Capturas de este README
```

> `AutoFac` y `AutoFacApi` son repositorios independientes, incluidos aquí como **submódulos de Git**; este repositorio (`AutoFacInfra`) los orquesta con Docker Compose.
> Si clonaste sin `--recurse-submodules`, ejecuta `git submodule update --init`. Para traer lo último de cada uno: `git submodule update --remote`.

- 🅰️ Frontend: [Johanlex20/AutoFac](https://github.com/Johanlex20/AutoFac)
- 🍃 Backend: [Johanlex20/AutoFacApi](https://github.com/Johanlex20/AutoFacApi)

---

## 🛠️ Tecnologías

| Capa | Tecnología | Uso |
|---|---|---|
| Frontend | Angular 22, TypeScript, Signals | SPA, enrutamiento, estado del carrito |
| Estilos | TailwindCSS 3, GSAP | Diseño, responsive, animaciones |
| UX | SweetAlert2 | Alertas y confirmaciones |
| Backend | Java 17, Spring Boot 3.5 | API REST, JPA, validaciones |
| Seguridad | Spring Security, JJWT 0.12 | Autenticación JWT, roles |
| Base de datos | MySQL 8, Hibernate | Persistencia |
| Automatización | Selenium 4, Chromium | Captura de facturas de Siigo |
| Reportes | Apache POI | Exportación a Excel |
| DevOps | Docker, Docker Compose, Nginx | Despliegue, volúmenes persistentes |
| Red | Cloudflare Tunnel | Publicación segura sin abrir puertos |

---

## 🚀 Instalación rápida

### Opción A · Docker (recomendada)

```bash
# 1. Clonar este repositorio junto con el frontend y el backend (submódulos)
git clone --recurse-submodules https://github.com/Johanlex20/AutoFacInfra.git
cd AutoFacInfra

# 2. Crear el archivo de entorno (ver tabla de variables)
cp .env.example .env   # edita los valores

# 3. Construir y levantar
docker compose up -d --build
```

| Servicio | URL local |
|---|---|
| Frontend | http://localhost:4210 |
| API | http://localhost:8090 |
| MySQL | localhost:3311 |

### Opción B · Desarrollo local

**Requisitos:** Java 17, Maven, Node 20+, MySQL 8, Chrome (solo para la captura de Siigo).

```bash
# Backend  → http://localhost:8080
cd AutoFacApi
./mvnw spring-boot:run

# Frontend → http://localhost:4200
cd AutoFac
npm install
npm start
```

Crea la base de datos `autofacapi` en MySQL; las tablas las genera Hibernate al arrancar.

### 🔧 Variables de entorno

| Variable | Descripción | Ejemplo |
|---|---|---|
| `DB_NAME` / `DB_USERNAME` / `DB_PASSWORD` | Conexión a MySQL | `autofacapi` |
| `JWT_SECRET` | Clave para firmar tokens (Base64, 256 bits) | *(genera una propia)* |
| `JWT_EXPIRATION` | Vigencia del token en ms | `3600000` |
| `ADMIN_EMAIL` / `ADMIN_PASSWORD` | Administrador inicial (se crea si no existe) | |
| `DEMO_EMAIL` / `DEMO_PASSWORD` | Usuario demo de solo lectura (vacío = no se crea) | `demo@autofac.com` |
| `DEMO_OCULTAR_DATOS_CLIENTES` | Oculta nombre y NIT de clientes al rol DEMO | `true` |
| `SIIGO_EMAIL` / `SIIGO_PASSWORD` | Credenciales de Siigo para la captura | |
| `SIIGO_SYNC_CRON` | Programación de la sincronización | `0 0 23 * * *` |
| `CORS_ORIGINS` | Orígenes permitidos, separados por coma | `http://localhost:4200` |

> ⚠️ Nunca subas el archivo `.env` al repositorio.

---

## 🔌 API REST

Documentación resumida. Todas las rutas (salvo login) requieren `Authorization: Bearer <token>`. Las escrituras (`POST`, `PUT`, `PATCH`, `DELETE`) exigen rol `ADMIN`.

| Recurso | Método | Ruta | Descripción |
|---|---|---|---|
| Auth | `POST` | `/api/auth/login` | Devuelve el JWT, correo y rol |
| Facturas | `GET` | `/api/data/list` | Lista las facturas capturadas |
| Facturas | `POST` | `/api/data/capturar` | Lanza la captura desde Siigo |
| Productos | `GET` | `/api/producto` | Lista el catálogo |
| Productos | `POST` `PUT` `DELETE` | `/api/producto[/{id}]` | Crear, editar, eliminar |
| Productos | `POST` `GET` | `/api/producto/imagen` · `/imagen/{nombre}` | Subir y servir imágenes |
| Documentos | `GET` | `/api/documento` · `/{id}/descargar` | Listar y descargar |
| Documentos | `POST` `PUT` `DELETE` | `/api/documento[/{id}]` | Subir, editar, eliminar |
| Perfil | `PUT` | `/api/perfil/password` | Cambiar contraseña |
| Perfil | `POST` `DELETE` `GET` | `/api/perfil/foto[/{nombre}]` | Foto de perfil |

---

## 🗺️ Hoja de ruta

- [x] Landing pública y catálogo de productos
- [x] Carrito de compras persistente
- [x] Login JWT con roles y usuario demo de solo lectura
- [x] Dashboard con gráficas
- [x] Captura automática de facturas de Siigo
- [x] Despliegue con Docker y Cloudflare Tunnel
- [ ] Pasarela de pagos (hoy el carrito muestra un aviso informativo)
- [ ] Módulo para restablecer contraseña
- [ ] Datos de contacto y redes sociales reales en el pie de página
- [ ] Pruebas automatizadas y CI con GitHub Actions

---

## 🤝 Redes sociales

- GitHub: https://github.com/Johanlex20
- LinkedIn: https://www.linkedin.com/in/johanlex20/

<div align="center">

Hecho con ☕ y mucho Angular + Spring por **Johan** · [@Johanlex20](https://github.com/Johanlex20)

</div>
