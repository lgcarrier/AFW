SET DEFINE OFF;
create or replace package body afw_25_plpdf_util_pkg
is
  function convr (pnu_mesr         in number
                 ,pva_unite_mesr   in varchar2)
    return number
  is
    vnu_mesr   number;
  begin
    case upper (pva_unite_mesr)
      when 'PT'
      then
        --pt: point (=1)
        vnu_mesr   := round (pnu_mesr);
      when 'MM'
      then
        --mm: millimeter (=72/25.4)
        vnu_mesr   := pnu_mesr * (72 / 25.4);
      when 'CM'
      then
        --cm: centimeter (=72/2.54)
        vnu_mesr   := pnu_mesr * (72 / 2.54);
      when 'IN'
      then
        --in: inch (=72)
        vnu_mesr   := pnu_mesr * 72;
    end case;

    return vnu_mesr;
  end convr;
end afw_25_plpdf_util_pkg;
/
