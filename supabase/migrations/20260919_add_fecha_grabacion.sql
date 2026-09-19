-- Añade la fecha real en la que se capturó cada sonido.
alter table public.registros_sonoros
  add column if not exists fecha_grabacion date;

-- Conserva los registros existentes usando su fecha de publicación.
update public.registros_sonoros
set fecha_grabacion = created_at::date
where fecha_grabacion is null;

alter table public.registros_sonoros
  alter column fecha_grabacion set not null;

comment on column public.registros_sonoros.fecha_grabacion is
  'Fecha en que se realizó la grabación, distinta de la fecha de publicación.';
