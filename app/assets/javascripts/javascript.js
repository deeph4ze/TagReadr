
$(document).ready(function(){
	$('.tweet').each(function(){
		size = ((Math.random()+1)*2)-1;
		$(this).css("font-size",(String(size)+"em"));
	});
	$('img').each(function(){
		size = ((Math.random()+1)*200);
		$(this).css("height",(String(size)+"px"));
		$(this).css("width",(String(size)+"px"));
		$(this).parent().css("width", (String(size+5)+"px"));
		$(this).parent().css("font-size", (String(size/240)+"em"))
	});
	$('#container').each(function(){
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
});
