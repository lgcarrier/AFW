SET DEFINE OFF;
create or replace force view vd_i_afw_03_journ
(
  date_heure
 ,expli
 ,ereur
 ,pile_trace
 ,travl
)
as
  select date_heure
        ,expli
        ,ereur
        ,pile_trace
        ,travl
    from afw_03_journ
/
