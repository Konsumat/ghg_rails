$ ->
  $('select').each ->
    $(this).change ->
      $(this).closest("form").submit();