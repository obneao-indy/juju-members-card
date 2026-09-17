-- Ver.0.2.81: 「弔蛍の蛹」をスタンプカード・推し呪物に追加。
-- 既存環境の Supabase SQL Editor で実行してください。再実行可能です。
-- ポイント付与は既存の record_sound_horror を使用（1回2pt）。
begin;

insert into public.sound_horrors (title, description, is_active)
values ('弔蛍の蛹', 'サウンドホラー作品', true)
on conflict (title) do update
set is_active = true, updated_at = now();

insert into public.relics (name, description, is_active)
select '弔蛍の蛹', '推し呪物候補', true
where not exists (select 1 from public.relics where name = '弔蛍の蛹');

update public.relics
set is_active = true, updated_at = now()
where name = '弔蛍の蛹';

commit;
