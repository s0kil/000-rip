

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('2f9a3c76-239b-4d31-aa2e-2159d7de935f', 'test@example.com', 'sha256|17|vM6PTnUPNM/23iKGODFPpg==|/7znWRm/5M5jAYOIeO5CVauDtq+CF1jOLiMSpGfO9cs=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.links DISABLE TRIGGER ALL;

INSERT INTO public.links (id, user_id, target, slug, created_at) VALUES ('449fc686-ba01-459e-b95f-00f9c8430ddc', '2f9a3c76-239b-4d31-aa2e-2159d7de935f', 'https://example.com', 'test', '2022-01-13 14:47:05.360974-05');
INSERT INTO public.links (id, user_id, target, slug, created_at) VALUES ('076feeba-3477-49b5-b5e3-101fd601de8e', '2f9a3c76-239b-4d31-aa2e-2159d7de935f', 'https://example.com', 'inkralleard', '2022-01-13 14:47:14.987671-05');


ALTER TABLE public.links ENABLE TRIGGER ALL;


