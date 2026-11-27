create table if not exists public.bpx_attempts (
 token uuid primary key, student text not null, name text not null, teacher text not null, category text not null,
 started timestamptz not null default now(), finished timestamptz, questions jsonb not null, answers jsonb not null default '[]'::jsonb, version integer not null default 0
);
create table if not exists public.bpx_presence (session text primary key, seen timestamptz not null default now());
alter table public.bpx_attempts enable row level security;
alter table public.bpx_presence enable row level security;
revoke all on public.bpx_attempts, public.bpx_presence from anon, authenticated;
grant all on public.bpx_attempts, public.bpx_presence to service_role;
