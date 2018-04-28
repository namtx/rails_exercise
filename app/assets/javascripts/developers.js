$(document).ready(function() {
  $('#languages, #programming_languages').each(function() {
    $(this).select2({width: '70%'});
    $(this).val($(this).data('selected')).trigger('change');
  });
});
