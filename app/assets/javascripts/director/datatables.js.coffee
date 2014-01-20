jQuery ->
  $('.dt_table').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('.dt_table').data('source')
  return