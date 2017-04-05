(function() {
  var ready = function () {
    window.setTimeout(function() {
      $('.alert')
        .fadeTo(500, 0)
        .slideUp(500, function(){ $(this).remove(); });
    }, 5000);
  };

  document.addEventListener('turbolinks:load', ready);
})();
