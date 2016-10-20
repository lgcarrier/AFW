SET DEFINE OFF;
create or replace force view vs_afw_01_contr
(
  seqnc_prodt
 ,code_prodt
 ,nom_prodt
 ,nom_table
 ,nom
 ,type
 ,schem
)
as
  select pro.seqnc
        ,pro.code
        ,pro.nom
        ,ac.table_name
        ,ac.constraint_name
        ,decode (constraint_type
                ,'P', 'Clé primaire'
                ,'R', 'Clé étrangère'
                ,'U', 'Clé unique'
                ,'C', 'Contrainte de vérification'
                ,constraint_type)
           type
        ,ac.owner
    from all_constraints ac
        ,afw_11_prodt    pro
   where     ac.constraint_name not like 'BIN$%'
         and ac.constraint_name not like 'SYS_%'
/
