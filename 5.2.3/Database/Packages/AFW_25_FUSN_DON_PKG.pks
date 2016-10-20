SET DEFINE OFF;
create or replace package afw_25_fusn_don_pkg
as
  type typ_tab_don_scalr is table of varchar2 (4000)
    index by varchar2 (50);

  type typ_rec_don_tablr is record
  (
    iden         varchar2 (50)
   ,iden_parnt   varchar2 (50)
   ,items        typ_tab_don_scalr
  );

  type typ_sectn_don_tablr is table of typ_rec_don_tablr
    index by varchar2 (50);

  type typ_sectn_tablr is record (lignes typ_sectn_don_tablr);

  type typ_tab_don_tablr is table of typ_sectn_tablr
    index by varchar2 (50);


  type typ_don_raprt is record
  (
    don_scalr   typ_tab_don_scalr
   ,don_tablr   typ_tab_don_tablr
  );

  type typ_img is record
  (
    mime_type    varchar2 (200)
   ,contn_binr   blob
  );

  --Pour l'exécution du execute immediate
  gob_don   typ_don_raprt;
  gob_img   typ_img;

  /* example
  declare
    vob_don typ_don_raprt;
    vva_nom varchar2(4000);
    vva_adres_livrs varchar2(4000);
  begin

    --Définition des données
    vob_don.don_scalr('nom_reltn_afair') := 'Bruno-Pierre Privé';
    vob_don.don_scalr('adres_reltn_afair') := '10 000 rue Stockholm, Québec, G2B 0L2';

    --Détails de facture
    --Ligne 1
    vob_don.don_tablr('items_factr').ligne(1).iden_parnt := null;
    vob_don.don_tablr('items_factr').ligne(1).items('quant_item') := 'VP64778-1';

    vob_don.don_tablr('items_factr_taxe').ligne(1).items('numr_factr') := 'fff';


    --Ligne 2
    vob_don.don_tablr('items_factr').ligne(2).iden_parnt := null;
    vob_don.don_tablr('items_factr').ligne(2).items('numr_factr') := 'VP64778-2';

    --Données scalaires
    vva_nom := vob_don.don_scalr('nom_reltn_afair');
    vva_adres_livrs := vob_don.don_scalr('adres_reltn_afair');

    dbms_output.put_line(vva_nom);
    dbms_output.put_line(vva_adres_livrs);

    --Données tabulaires
    for i in vob_don.don_tablr('items_factr').ligne.first..vob_don.don_tablr('items_factr').ligne.last loop
       dbms_output.put_line('ligne ' || i);
    end loop;
  end;
  */

  procedure impri_don_trace (pob_don        typ_don_raprt
                            ,pbo_table   in boolean default false);


  procedure exect_fusn (pnu_travl         in number
                       ,pnu_travl_publc   in number);
end afw_25_fusn_don_pkg;
/
