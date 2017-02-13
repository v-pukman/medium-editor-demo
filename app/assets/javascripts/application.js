//= require jquery
//= require jquery_ujs
//= require medium-editor
//= require medium-editor-plugins

$(document).ready(function(){

  var markdown = $(".markdown pre");

  var editor = new MediumEditor('.editable', {
    toolbar: {
      buttons: [
        'bold',
        'italic',
        'table',
        'b',
        'h2',
        'warning',
        'pop'
      ]
    },
    extensions: {
      table: new MediumEditorTable(),

      // compact
      'b':  new MediumButton({label:'BOLD', start:'<b>', end:'</b>'}),
      'h2': new MediumButton({label:'h2', start:'<h2>', end:'</h2>'}),

      // expanded
      'warning': new MediumButton({
          label: '<i class="fa fa-exclamation-triangle"></i>',
          start: '<div class="warning">',
          end:   '</div>'
       }),

      // with JavaScript
      'pop': new MediumButton({
        label:'POP',
        action: function(html, mark, parent){
                  alert('hello :)')
                  return html
                }
      }),

      markdown: new MeMarkdown(function (md) {
        markdown.html(md);
      })
    }

  });

  $('.editable').mediumInsert({
    editor: editor,
    addons: {
      images: {
        fileUploadOptions: {
          url: '/images/upload',
          acceptFileTypes: /(.|\/)(gif|jpe?g|png)$/i
        },

        fileDeleteOptions: {
          url: '/images/delete',
        }
      }
    }
  });

})
