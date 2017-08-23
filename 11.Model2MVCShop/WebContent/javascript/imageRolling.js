// moveType (0:left / 1:right) 
//var moveType = 0; 

// 이동시간간격 1.2초 
var moveSpeed = 1000; 

// 움직이는 작업중 다시 명령 받지 않음 
var moveWork = false; 

// 일시정지 flag 
//var movePause = false; 

function imgMove(fileCount){ 
	
    //if(moveWork==false){ 
    	
     // 0d\일경우 left방향 
     //if(moveType==0){ 
	
	//console.log("마 도랏나")
	//var countLength = fileCount.length;
	
	/*for(var i = 0; i < countLength; i++) {
		
		console.log(i);
		console.log($($(".rollingList > div > a")[i]).html());
		
		var aWidth = $($(".rollingList > div > a")[i]).width(); 
		console.log(aWidth);
		
		// $(".rollingList > div").append("<a>" + $($(".rollingList > div > a")[]).html()+ "</a>");
		
	}*/
	
	$(".rollingList > div").each(function(index, elem){
		//console.log("index : "+index+", html :: "+$(this).html());
		//console.log(elem);
		//console.log($(elem).children("a")[0]);
		//console.log($($(elem).children("a")[0]).html());
		
		
		var aWidth = $($(elem).children("a")[0]).width(); 
		//console.log(aWidth);
		
		$(this).append("<a>" + $($(elem).children("a")[0]).html()+ "</a>"); 
		//console.log($(this).html());
		
	})
	
	var index = 0;
	
	$($($(".rollingList > div")[0]).children("a")[0] , $($(".rollingList > div")[1]).children("a")[0], $($(".rollingList > div")[2]).children("a")[0]).animate(
			{opacity:1},
			{duration:moveSpeed,
				step:function(elem){
					//console.log($(elem).html());
					//console.log("@@@@@"+$(this).next().html().trim());
			}
	
	,complete:function(){ 
		
		
		
		$(this).css("opacity","0");
		$($($(".rollingList > div")[1]).children("a")[0]).css("opacity","0");
		$($($(".rollingList > div")[2]).children("a")[0]).css("opacity","0");
		$(this).remove(); 
		$($($(".rollingList > div")[1]).children("a")[0]).remove();
		$($($(".rollingList > div")[2]).children("a")[0]).remove();
		imgMove();
	}
	}); 
	
	//console.log($(this).html());
	
	
	
	//imgMove();
	
	
    /*     // 맨처음 이미지의 폭 
         var aWidth = $(".rollingList > div > a:first").width(); 
         
         // 롤링마지막에 맨처음의 a태그 추가 
         $(".rollingList > div").append("<a>" + $(".rollingList > div > a:first").html()+ "</a>"); 
         
        // console.log($(".rollingList > div > a:first").html());
         
         
         //imgMove();
         // 맨처음이미지를 왼쪽으로 이동시킨다. 
         $(".rollingList > div > a:first").animate({opacity:1},{duration:moveSpeed,step:function(){ 
         
        	
        
        	 // 이동중 만약 일시정지 flag가 true라면 
         //if(movePause==true){ 
            // 이동을 멈춘다 
         //   $(this).stop(); 
        // } 
         
         },complete:function(){ 
         // 이동을 마친후 첫번째 a태그를 지워버린다 
         $(this).css("opacity","0");
         $(this).remove(); 
         // 이미지 움직이는것을 다시 실행 
         //imgMove(); 
         }
         }); 
     // } 
 //} 
 } 
 function goMove(){ 
    // 일시정지가 풀려있을 경우를 대비하여 일시정지를 풀러준다 
    movePause=false; 
    // 0d\일경우 left방향 
    if(moveType==0){ 
       imgMove(); 
       }else{ 
       $(".rollingList > div > a:first").animate({marginLeft:0},{duration:moveSpeed,step:function(){ 
       // 이동중 만약 일시정지 flag가 true라면 
       if(movePause==true){ 
          // 이동을 멈춘다 
          $(this).stop(); 
      } 
       },complete:function(){ 
      // 이동을 마친후 마지막 a태그를 지워버린다 
      //$(".rollingList > div > a:last").remove(); 
      // 이미지 움직이는것을 다시 실행 
      imgMove(); 
   }}); 
}*/
   
}
//imgMove(); 