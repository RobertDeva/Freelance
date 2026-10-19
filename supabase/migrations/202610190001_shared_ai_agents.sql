-- Esquema compartido para Torque AI y Glow Desk.
create extension if not exists pgcrypto;
create table if not exists public.ai_businesses (
 slug text primary key check (slug in ('torque','glow')),
 display_name text not null,
 timezone text not null default 'America/New_York',
 business_hours jsonb not null default '{}'::jsonb,
 services jsonb not null default '[]'::jsonb,
 faq jsonb not null default '{}'::jsonb,
 created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
create table if not exists public.ai_contacts (
 id uuid primary key default gen_random_uuid(),
 business_slug text not null references public.ai_businesses(slug) on delete cascade,
 name text not null check (char_length(name) between 1 and 120),
 phone text, email text,
 channel text not null default 'web' check (channel in ('web','whatsapp','manual')),
 consent_at timestamptz,
 created_at timestamptz not null default now(),
 unique (business_slug, phone)
);
create table if not exists public.ai_appointments (
 id uuid primary key default gen_random_uuid(),
 business_slug text not null references public.ai_businesses(slug) on delete cascade,
 contact_id uuid references public.ai_contacts(id) on delete set null,
 customer_name text not null check (char_length(customer_name) between 1 and 120),
 customer_phone text,
 service_name text not null check (char_length(service_name) between 1 and 160),
 resource_name text not null default 'general' check (char_length(resource_name) between 1 and 100),
 starts_at timestamptz not null, ends_at timestamptz not null,
 status text not null default 'pending' check (status in ('pending','confirmed','cancelled','completed','no_show')),
 notes text not null default '' check (char_length(notes) <= 1200),
 source_channel text not null default 'web' check (source_channel in ('web','whatsapp','manual')),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
 check (ends_at > starts_at)
);
create index if not exists ai_appointments_business_start_idx on public.ai_appointments (business_slug, starts_at);
create table if not exists public.ai_conversations (
 id uuid primary key default gen_random_uuid(),
 business_slug text not null references public.ai_businesses(slug) on delete cascade,
 channel text not null check (channel in ('web','whatsapp')),
 external_id text, contact_id uuid references public.ai_contacts(id) on delete set null,
 status text not null default 'open' check (status in ('open','needs_human','closed')),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create table if not exists public.ai_messages (
 id bigint generated always as identity primary key,
 conversation_id uuid not null references public.ai_conversations(id) on delete cascade,
 role text not null check (role in ('user','assistant','system','human')),
 body text not null check (char_length(body) between 1 and 5000),
 metadata jsonb not null default '{}'::jsonb, created_at timestamptz not null default now()
);
create table if not exists public.ai_reviews (
 id uuid primary key default gen_random_uuid(),
 business_slug text not null references public.ai_businesses(slug) on delete cascade,
 platform text not null default 'manual', external_review_id text, reviewer_name text,
 rating smallint check (rating between 1 and 5),
 review_text text not null default '' check (char_length(review_text) <= 5000),
 suggested_reply text not null default '',
 status text not null default 'needs_review' check (status in ('needs_review','approved','published','ignored')),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now(),
 unique (business_slug, platform, external_review_id)
);
create table if not exists public.ai_audit_events (
 id bigint generated always as identity primary key,
 business_slug text not null references public.ai_businesses(slug) on delete cascade,
 event_type text not null check (char_length(event_type) between 1 and 100),
 channel text not null default 'web', details jsonb not null default '{}'::jsonb,
 created_at timestamptz not null default now()
);
create table if not exists public.ai_rate_limits (
 bucket_key text primary key, window_started_at timestamptz not null default now(),
 request_count integer not null default 0 check (request_count >= 0)
);
alter table public.ai_businesses enable row level security;
alter table public.ai_contacts enable row level security;
alter table public.ai_appointments enable row level security;
alter table public.ai_conversations enable row level security;
alter table public.ai_messages enable row level security;
alter table public.ai_reviews enable row level security;
alter table public.ai_audit_events enable row level security;
alter table public.ai_rate_limits enable row level security;
revoke all on public.ai_businesses, public.ai_contacts, public.ai_appointments,
 public.ai_conversations, public.ai_messages, public.ai_reviews, public.ai_audit_events,
 public.ai_rate_limits from anon, authenticated;
insert into public.ai_businesses (slug,display_name,timezone,business_hours,services,faq) values
('torque','Torque AI · Taller automotriz','America/New_York',
 '{"mon-fri":"08:00-18:00","sat":"09:00-16:00","sun":"closed"}',
 '[{"name":"Cambio de aceite","duration_minutes":60},{"name":"Diagnóstico del motor","duration_minutes":90},{"name":"Frenos","duration_minutes":120},{"name":"Mantenimiento general","duration_minutes":120},{"name":"Neumáticos","duration_minutes":60}]',
 '{"pricing":"El precio se confirma tras conocer el vehículo y el servicio.","status":"El equipo debe verificar el estado de la orden."}'),
('glow','Glow Desk · Salón de belleza','America/New_York',
 '{"mon-sat":"09:00-18:00","sun":"closed"}',
 '[{"name":"Manicura gel","duration_minutes":60},{"name":"Corte y peinado","duration_minutes":60},{"name":"Coloración","duration_minutes":120},{"name":"Facial hidratante","duration_minutes":60},{"name":"Depilación","duration_minutes":30},{"name":"Maquillaje","duration_minutes":60}]',
 '{"pricing":"El negocio confirma el precio vigente.","changes":"No afirmar que una cita cambió hasta validar la operación."}')
on conflict (slug) do nothing;
