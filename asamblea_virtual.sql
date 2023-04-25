-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-04-2023 a las 22:17:54
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asamblea_virtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asambleas`
--

CREATE TABLE `asambleas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asambleas`
--

INSERT INTO `asambleas` (`id`, `nombre`, `descripcion`, `tipo`, `fecha_hora`, `created_at`, `updated_at`) VALUES
(1, 'Jose yyou', 'hey you whats up', '2', '2023-03-25 15:34:44', NULL, '2023-04-01 00:56:45'),
(3, 'asamblea raw', 'desc dfgdfhdhdh jytg', '1', '2023-03-25 15:34:44', '2023-04-01 19:04:19', '2023-04-01 19:04:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asamblea_persona`
--

CREATE TABLE `asamblea_persona` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `persona_id` bigint(20) UNSIGNED NOT NULL,
  `asamblea_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asamblea_persona`
--

INSERT INTO `asamblea_persona` (`id`, `persona_id`, `asamblea_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 1, 3, '2023-04-01 19:04:19', '2023-04-01 19:04:19'),
(4, 2, 3, '2023-04-01 19:04:19', '2023-04-01 19:04:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_personas`
--

CREATE TABLE `estado_personas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_personas`
--

INSERT INTO `estado_personas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Activo', NULL, NULL),
(2, 'Inactivo', NULL, NULL),
(3, 'Fallecido', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_temarios`
--

CREATE TABLE `estado_temarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_temarios`
--

INSERT INTO `estado_temarios` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Activa ', NULL, NULL),
(2, 'Inactiva', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formularios`
--

CREATE TABLE `formularios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `persona_id` bigint(20) UNSIGNED NOT NULL,
  `temario_id` bigint(20) UNSIGNED NOT NULL,
  `opciones_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `formulario_detalle_id` bigint(20) NOT NULL,
  `respuesta_libr` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `formularios`
--

INSERT INTO `formularios` (`id`, `persona_id`, `temario_id`, `opciones_id`, `created_at`, `updated_at`, `formulario_detalle_id`, `respuesta_libr`) VALUES
(4, 88, 1, 2, '2023-04-26 00:41:50', '2023-04-26 00:41:50', 1, NULL),
(5, 89, 1, 2, '2023-04-26 00:46:48', '2023-04-26 00:46:48', 1, NULL),
(6, 93, 3, 6, '2023-04-26 01:11:50', '2023-04-26 01:11:50', 2, 'stephany ok'),
(7, 93, 1, 2, '2023-04-26 01:12:42', '2023-04-26 01:12:42', 1, NULL),
(8, 93, 1, 6, '2023-04-26 01:12:42', '2023-04-26 01:12:42', 1, 'fgfdgd'),
(9, 93, 2, 6, '2023-04-26 01:12:43', '2023-04-26 01:12:43', 1, 'fdgdg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_detalle`
--

CREATE TABLE `formulario_detalle` (
  `id` bigint(20) NOT NULL,
  `nombre_formulario` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulario_detalle`
--

INSERT INTO `formulario_detalle` (`id`, `nombre_formulario`, `fecha`, `updated_at`, `created_at`) VALUES
(1, 'primer debate', '2023-04-20', NULL, NULL),
(2, 'formulario modficado', '2023-04-22', '2023-04-20 19:53:58', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_preguntas`
--

CREATE TABLE `formulario_preguntas` (
  `id` bigint(20) NOT NULL,
  `formulario_detalle_id` bigint(20) NOT NULL,
  `temario_id` bigint(20) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formulario_preguntas`
--

INSERT INTO `formulario_preguntas` (`id`, `formulario_detalle_id`, `temario_id`, `updated_at`, `created_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(4, 2, 3, '2023-04-20 20:36:15', '2023-04-20 20:36:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_24_165157_create_estado_personas_table', 1),
(6, '2023_03_24_192321_create_asambleas_table', 1),
(7, '2023_03_24_192354_create_estado_temarios_table', 1),
(8, '2023_03_24_192524_create_personas_table', 1),
(9, '2023_03_24_192635_create_asamblea_personas_table', 1),
(10, '2023_03_24_194101_create_opciones_table', 1),
(11, '2023_03_24_194145_create_temarios_table', 1),
(12, '2023_03_24_194204_create_opcion_temarios_table', 1),
(13, '2023_03_24_194248_create_formularios_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id`, `nombre`, `created_at`, `updated_at`, `type`) VALUES
(1, 'si', NULL, '2023-04-01 18:11:50', 'radio'),
(2, 'No', NULL, NULL, 'radio'),
(3, 'Tal Vez', NULL, NULL, 'textarea'),
(4, 'alguna vez', '2023-04-01 02:41:35', '2023-04-01 02:41:35', 'textarea'),
(6, 'respuesta libre', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion_temario`
--

CREATE TABLE `opcion_temario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `temario_id` bigint(20) UNSIGNED NOT NULL,
  `opcion_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `opcion_temario`
--

INSERT INTO `opcion_temario` (`id`, `temario_id`, `opcion_id`, `created_at`, `updated_at`) VALUES
(1, 3, 4, '2023-04-01 19:19:56', '2023-04-01 19:19:56'),
(2, 4, 3, '2023-04-01 19:19:56', '2023-04-21 18:47:00'),
(3, 1, 1, '2023-04-01 22:18:23', '2023-04-01 22:18:23'),
(4, 1, 2, '2023-04-01 22:18:23', '2023-04-01 22:18:23'),
(8, 2, 3, NULL, NULL),
(9, 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `agencia` varchar(255) NOT NULL,
  `celular` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `grupo` int(11) NOT NULL,
  `rol_id` bigint(20) NOT NULL,
  `estado_personas_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `cedula`, `nombre`, `agencia`, `celular`, `correo`, `grupo`, `rol_id`, `estado_personas_id`, `created_at`, `updated_at`) VALUES
(88, 11145678, 'steven', 'meridian 777', '3125478964', 'julanito1@gmail.com', 1, 2, 2, '2023-04-22 22:07:28', '2023-04-22 22:07:28'),
(89, 11455679, 'steven 2', 'meridian 778', '3125477894', 'julanito2@gmail.com', 1, 2, 3, '2023-04-22 22:07:28', '2023-04-22 22:07:28'),
(90, 11155506, 'steven 3', 'meridian 779', '3128521964', 'julanito3@gmail.com', 2, 1, 2, '2023-04-22 22:07:28', '2023-04-22 22:07:28'),
(91, 11145681, 'steven 4', 'meridian 780', '3115478964', 'julanito4@gmail.com', 1, 2, 1, '2023-04-22 22:07:28', '2023-04-22 22:07:28'),
(92, 11333568, 'steven 5', 'meridian 781', '3127778964', 'julanito5@gmail.com', 2, 2, 2, '2023-04-22 22:07:28', '2023-04-22 22:07:28'),
(93, 10245683, 'steven 6', 'meridian 782', '3125147001', 'julanito6@gmail.com', 1, 1, 1, '2023-04-22 22:07:28', '2023-04-22 22:07:28'),
(94, 10247524, 'steven 7', 'meridian 783', '3025147001', 'julanito7@gmail.com', 2, 1, 1, '2023-04-22 22:07:28', '2023-04-22 22:07:28'),
(95, 11145678, 'steven', 'meridian 777', '3125478964', 'julanito1@gmail.com', 1, 2, 2, '2023-04-22 22:08:12', '2023-04-22 22:08:12'),
(96, 11455679, 'steven 2', 'meridian 778', '3125477894', 'julanito2@gmail.com', 1, 2, 3, '2023-04-22 22:08:12', '2023-04-22 22:08:12'),
(97, 11155506, 'steven 3', 'meridian 779', '3128521964', 'julanito3@gmail.com', 2, 1, 2, '2023-04-22 22:08:12', '2023-04-22 22:08:12'),
(98, 11145681, 'steven 4', 'meridian 780', '3115478964', 'julanito4@gmail.com', 1, 2, 1, '2023-04-22 22:08:12', '2023-04-22 22:08:12'),
(99, 11333568, 'steven 5', 'meridian 781', '3127778964', 'julanito5@gmail.com', 2, 2, 2, '2023-04-22 22:08:12', '2023-04-22 22:08:12'),
(100, 10245683, 'steven 6', 'meridian 782', '3125147001', 'julanito6@gmail.com', 1, 1, 1, '2023-04-22 22:08:12', '2023-04-22 22:08:12'),
(101, 10247524, 'steven 7', 'meridian 783', '3025147001', 'julanito7@gmail.com', 2, 1, 1, '2023-04-22 22:08:12', '2023-04-22 22:08:12'),
(102, 11145678, 'steven', 'meridian 777', '3125478964', 'julanito1@gmail.com', 1, 2, 2, '2023-04-24 21:41:22', '2023-04-24 21:41:22'),
(103, 11455679, 'steven 2', 'meridian 778', '3125477894', 'julanito2@gmail.com', 1, 2, 3, '2023-04-24 21:41:22', '2023-04-24 21:41:22'),
(104, 11155506, 'steven 3', 'meridian 779', '3128521964', 'julanito3@gmail.com', 2, 1, 2, '2023-04-24 21:41:22', '2023-04-24 21:41:22'),
(105, 11145681, 'steven 4', 'meridian 780', '3115478964', 'julanito4@gmail.com', 1, 2, 1, '2023-04-24 21:41:22', '2023-04-24 21:41:22'),
(106, 11333568, 'steven 5', 'meridian 781', '3127778964', 'julanito5@gmail.com', 2, 2, 2, '2023-04-24 21:41:22', '2023-04-24 21:41:22'),
(107, 10245683, 'steven 6', 'meridian 782', '3125147001', 'julanito6@gmail.com', 1, 1, 1, '2023-04-24 21:41:22', '2023-04-24 21:41:22'),
(108, 10247524, 'steven 7', 'meridian 783', '3025147001', 'julanito7@gmail.com', 2, 1, 1, '2023-04-24 21:41:22', '2023-04-24 21:41:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Consejero'),
(2, 'Delegado'),
(3, 'Suplente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temarios`
--

CREATE TABLE `temarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `posicion` int(255) NOT NULL,
  `estado_temario_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `temarios`
--

INSERT INTO `temarios` (`id`, `nombre`, `posicion`, `estado_temario_id`, `created_at`, `updated_at`) VALUES
(1, '¿esta de acuerdo con David?', 12, 1, NULL, '2023-04-01 01:35:20'),
(2, '¿esta de acuerdo con el tiempo del break?', 0, 1, NULL, NULL),
(3, '¿Sthephany hace buena pareja con Sebastian?', 1, 1, '2023-04-01 01:28:05', '2023-04-01 01:28:05'),
(4, '¿Alguien gusta de Camila y Cafe Con leche?', 5, 1, '2023-04-01 19:19:56', '2023-04-01 19:19:56'),
(5, '¿estas a gusto en coopserp?', 2, 1, '2023-04-01 22:18:23', '2023-04-01 22:18:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asambleas`
--
ALTER TABLE `asambleas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asamblea_persona`
--
ALTER TABLE `asamblea_persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asamblea_personas_persona_id_foreign` (`persona_id`),
  ADD KEY `asamblea_personas_asamblea_id_foreign` (`asamblea_id`);

--
-- Indices de la tabla `estado_personas`
--
ALTER TABLE `estado_personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_temarios`
--
ALTER TABLE `estado_temarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `formularios`
--
ALTER TABLE `formularios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formularios_persona_id_foreign` (`persona_id`),
  ADD KEY `formularios_temario_id_foreign` (`temario_id`),
  ADD KEY `formularios_opciones_id_foreign` (`opciones_id`),
  ADD KEY `formulario_detalle_id` (`formulario_detalle_id`);

--
-- Indices de la tabla `formulario_detalle`
--
ALTER TABLE `formulario_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `formulario_preguntas`
--
ALTER TABLE `formulario_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formulario_detalle_id` (`formulario_detalle_id`),
  ADD KEY `temario_id` (`temario_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opcion_temario`
--
ALTER TABLE `opcion_temario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opcion_temarios_temario_id_foreign` (`temario_id`),
  ADD KEY `opcion_temarios_opcion_id_foreign` (`opcion_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personas_estado_personas_id_foreign` (`estado_personas_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temarios`
--
ALTER TABLE `temarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temarios_estado_temario_id_foreign` (`estado_temario_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asambleas`
--
ALTER TABLE `asambleas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `asamblea_persona`
--
ALTER TABLE `asamblea_persona`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado_personas`
--
ALTER TABLE `estado_personas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_temarios`
--
ALTER TABLE `estado_temarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formularios`
--
ALTER TABLE `formularios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `formulario_detalle`
--
ALTER TABLE `formulario_detalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `formulario_preguntas`
--
ALTER TABLE `formulario_preguntas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `opcion_temario`
--
ALTER TABLE `opcion_temario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `temarios`
--
ALTER TABLE `temarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asamblea_persona`
--
ALTER TABLE `asamblea_persona`
  ADD CONSTRAINT `asamblea_personas_asamblea_id_foreign` FOREIGN KEY (`asamblea_id`) REFERENCES `asambleas` (`id`),
  ADD CONSTRAINT `asamblea_personas_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `formularios`
--
ALTER TABLE `formularios`
  ADD CONSTRAINT `formularios_ibfk_1` FOREIGN KEY (`formulario_detalle_id`) REFERENCES `formulario_detalle` (`id`),
  ADD CONSTRAINT `formularios_opciones_id_foreign` FOREIGN KEY (`opciones_id`) REFERENCES `opciones` (`id`),
  ADD CONSTRAINT `formularios_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `formularios_temario_id_foreign` FOREIGN KEY (`temario_id`) REFERENCES `temarios` (`id`);

--
-- Filtros para la tabla `formulario_preguntas`
--
ALTER TABLE `formulario_preguntas`
  ADD CONSTRAINT `formulario_preguntas_ibfk_1` FOREIGN KEY (`formulario_detalle_id`) REFERENCES `formulario_detalle` (`id`),
  ADD CONSTRAINT `formulario_preguntas_ibfk_2` FOREIGN KEY (`temario_id`) REFERENCES `temarios` (`id`);

--
-- Filtros para la tabla `opcion_temario`
--
ALTER TABLE `opcion_temario`
  ADD CONSTRAINT `opcion_temarios_opcion_id_foreign` FOREIGN KEY (`opcion_id`) REFERENCES `opciones` (`id`),
  ADD CONSTRAINT `opcion_temarios_temario_id_foreign` FOREIGN KEY (`temario_id`) REFERENCES `temarios` (`id`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_estado_personas_id_foreign` FOREIGN KEY (`estado_personas_id`) REFERENCES `estado_personas` (`id`),
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `temarios`
--
ALTER TABLE `temarios`
  ADD CONSTRAINT `temarios_estado_temario_id_foreign` FOREIGN KEY (`estado_temario_id`) REFERENCES `estado_temarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
