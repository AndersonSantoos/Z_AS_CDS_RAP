@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS consumo app vendas'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_AS_VENDAS as projection on ZI_AS_VENDAS
{
    key VendaId,
    DataVenda,
    Vendendor,
    /* Associations */
    _Item
}
