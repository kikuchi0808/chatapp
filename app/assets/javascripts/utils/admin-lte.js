(function() {
  var ready = function () {
    $.AdminLTE.layout.activate();
  };

  document.addEventListener('turbolinks:load', ready);
})();
