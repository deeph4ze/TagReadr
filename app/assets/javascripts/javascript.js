
$(document).ready(function(){
	$('.tweet').each(function(){
		/*size = ((Math.random()+1)*2)-1;                    *****This was the code to random resize
		$(this).css("font-size",(String(size)+"em"));
            $(this).css("width", (String(size*150)+"px"));*/
            weight = $(this).data("weight");
            if (weight < 10) {
                  fontsize = "1em";
                  width = "220px";
            }
            else if (weight < 25){
                  fontsize = "1.25em";
                  width = "460px";
            }
            else {
                  fontsize = "1.5em";
                  width ="700px";
            }
            $(this).css("font-size", fontsize);
            $(this).css("width", width);
	});
	$('img').each(function(){
		/*size = ((Math.random()+1)*200);                   ***Random Resize
		$(this).css("height",(String(size)+"px"));
		$(this).css("width",(String(size)+"px"));
		$(this).parent().css("width", (String(size+5)+"px"));
		$(this).parent().css("font-size", (String(size/240)+"em"))*/
            weight = $(this).parent().data("weight");
            if (weight < 10) {
                  fontsize = "1em";
                  width = 210;
            }
            else if (weight < 45){
                  fontsize = "1.5em";
                  width = 450;
            }
            else {
                  fontsize = "1.5em";
                  width = 690;
            }
            $(this).parent().css("width", String(width+10)+"px");
            $(this).parent().css("font-size", fontsize);
            $(this).css("width", (String(width))+"px");
	});

      //FUNCTIONS FOR ORDERING THE ITEMS
	$('#contentcontainer').each(function(){
            
            // get current ul
            var $div = $(this);
            // get array of list items in current ul
            var $liArr = $div.children();
            // sort array of list items in current ul randomly
            $liArr.sort(function(a,b){
                  // Get a random number between 0 and 10
                  var temp = parseInt( Math.random()*10 );
                  // Get 1 or 0, whether temp is odd or even
                  var isOddOrEven = temp%2;
                  // Get +1 or -1, whether temp greater or smaller than 5
                  var isPosOrNeg = temp>5 ? 1 : -1;
                  // Return -1, 0, or +1
                  return( isOddOrEven*isPosOrNeg );
            })
            // append list items to ul
            .appendTo($div);          
      });

      //MASONRY

});
