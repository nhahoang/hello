//= require jquery
//= require jquery_ujs
//= require_tree

function find(){
  if (confirm('Are you sure delete selected ?')){
    var inputs = document.getElementsByTagName("input");
     for (i=0;i<inputs.length;i++){
        if ((inputs[i].type == "checkbox") && (inputs[i].checked == true)){
          //alert (inputs[i].value);
          //alert ("/books/"+ inputs[i].value);
          $.ajax({
              url: "/books/"+ inputs[i].value,
              type: 'DELETE'
            }).done(
              function(){
                reload();
                //alert ('Delete successfully');
              }
           );
        }
    }
    alert ('Delete successfully');
  }
}

function reload() {
  $.ajax( {
    url: "/books/list",
    type: 'GET'
  }).done(
    function(data) {
      var c = document.getElementById("list");
      c.innerHTML = data;
    }
  );
}

