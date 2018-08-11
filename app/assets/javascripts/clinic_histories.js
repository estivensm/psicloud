
   $(document).on('turbolinks:load',function() {
   $('.chosen-select1').chosen(
         {
   
           allow_single_deselect: true,
           no_results_text: 'No hay resultados',
           placeholder_text_single: "Seleccione una opción",
           placeholder_text_multiple: "Seleccione una varias opciones"
   
         });
         });




