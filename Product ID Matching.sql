-- Select to return Product list of new IDs from old system ID list after data merge


select
'INSERT REGION' AS REGION  --Change this to reflect the region you are running the script for.
,   lot.leaf as TYPE
,   title.PT_TITLE as v29_NAME
,   CAST(prod.oid as VARCHAR(20)) as v29_OID
,   CAST(prod.PRD_EXTERNAL_REFERENCE as VARCHAR(20)) as v29_EXTERNALREFERENCE
,   CAST(prod.PRD_PRODUCTCODE as VARCHAR(50)) as v29_PRODUCTCODE
,   prog.prg_year as v29_SEASON
,   prod.MIGRATIONORIGIN as v27_SITE
,  	CAST(prod.MIGRATIONOID as VARCHAR(20)) as V27_PRODUCT_OID
,   CAST(prod.PRD_MIGPRODUCTCODE as VARCHAR(50)) as v27_PRODUCTCODE
from psi.psiproductpart prod
left join psi.psiprogrampart prog on prod.oid=prog.PRODUCTPART --Might be excluding "One Off" shows
left join psi.psiproducttitle title on prod.PRD_ID_BRDCSTTITLE=title.oid
left join psi.leafoftree lot on lot.oid=prod.prd_id_producttype
where prod.migrationorigin is not null
and prod.MIGRATIONORIGIN = 'sbsse'  --Change to match region 
;
