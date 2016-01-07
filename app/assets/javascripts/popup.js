
$(document).ready(function(){
  PopUpHide();
});

function PopUpShow(str){
  $("#popup-bg").show();
  $("#popup-content").append(str);
}
  
function PopUpHide(){
  $("#popup-bg").hide();
}
