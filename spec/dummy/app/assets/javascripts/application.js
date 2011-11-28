/* This is a manifest file that'll be compiled into including all the files listed below.
 * Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
 * be included in the compiled file accessible from http://example.com/assets/application.js
 * It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
 * the compiled file.
 *
 *= require jquery.min.js
 *= require jquery-ui.min.js
 *= require jquery_ujs.js
 *= require el_vfs/elfinder.js
 *= require el_vfs/i18n/elfinder.ru.js
 */
$(function() {
  $('#elfinder').elfinder({
    lang: 'ru',
  height: '600',
  url: '/el_vfs/api/elfinder',
  width: 1000,
  height: 400,
  resizable: false,
  ui: ['toolbar' ],
  uiOptions:{
    toolbar : [
      ['back', 'forward'],
      ['reload'],
      ['home', 'up'],
      ['mkdir', 'uploadsad'],
      ['open', 'download', 'getfile'],
      ['info'],
      ['quicklook'],
      ['rm'],
      ['rename'],
      ['view'],
      ['help']
    ]
  }
  });
});

