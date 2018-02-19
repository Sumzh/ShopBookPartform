$(function(){
	
	
	
	
	//hiddenprice${l_index}
	$(".sumbook").hide();
	$(".hiddenprice").hide();
  
	$(".hiddenprice*").hide();
	

	//sumprice
	
	var len=($(":checkbox:checked").length);
	
	
	$(".sumbookAcount").attr("value",len);
	
	
	//计算总的全部价格
	
	
	
	

	
	
	
	
	
	
	$(".sumprice").attr("value",0);

	
	
	
	
	
  /*$("input[type='submit']").click(function(){
		
		
		var len=($(":checkbox:checked").length);
		
		alert(len);

		return false;
		
		})*/
	
	
		
		
//	动态的
		
		
     var userbook= parseInt($(".sumbook").attr("value"));		
  
 
     //hiddenprice
     
     
     for(var is=0;is<userbook;is++){
    	 
    	 
    	 $(".hiddenprice"+is+"").hide();
    	 
    	 
    	 
     }
  
      
      var i=0;

    for(i=0; i<userbook; i++){
    	
    	
    	 $(".checkbox"+i+"").click(function(){
    		
    		
    		
    		var len=($(":checkbox:checked").length);
    		
    		
    		$(".sumbookAcount").attr("value",len);
    		
    		i++;
    	 
    		
    	});
    	
    	
    	
    };
  
  //完成
	
	var sumprice=0;
	
	for(var i2=0;i2<userbook;i2++){
		
		
		var thisprice2=$(".hiddenprice"+i2+"").attr("value");
		
		sumprice=sumprice+parseInt(thisprice2);
	}
	
	//$(".sumprice").attr("value",sumprice);
	
	
	
	//赋予总价~！
	
    for(i=0; i<userbook; i++){
    	
    	
   	 $(".checkbox"+i+"").click(function(){
   		
   	      var price=null;
   		 
   		for(var i1=0;i1<userbook;i1++){
   			
   		//$("input[type='checkbox']").is(':checked')
   	  if($(".checkbox"+i1+"").is(':checked')==true){
   		  
   		 
   		  
   		var thisprice=parseInt($(".hiddenprice"+i1+"").attr("value"));
   		
   		
   	     	
   		  price+=thisprice;
   		  
   	
		  
   	      }
   	  
   	  
   	 
   			
   		}

   	 $(".sumprice").attr("value",price);
   		
   	
   	 
   		
   	});
   	
   	
   	
   }
    
    
    //提示用户要支付的金额,拼接url 获取原来的url 拼接动态参数
    
    
    
    $(".submitbuttom").click(function(){
    	
    	
    	
    	  var money=$(".sumprice").attr("value");
    	
    	  
    	    var arrayId= new Array();
    	  
    	    
    	    
    	  $("input:checked").each(function(){
    		  
    		 
    		  arrayId.push($(this).attr("Id"));
    		  
    		  
    		  
    	  });
        
    	  var urls= $(".payform").attr("action");
    	  
    	 
    	  
            var IdUrl=urls+"?";
         
            
    	 for(var IdLen=0;IdLen<arrayId.length;IdLen++){
    		 
    		 IdUrl+="bookId"+IdLen+"="+arrayId[IdLen]+"&";
    		 
    		 
    	    } 
    	  
    	  
         var  usernames=$(":input[type='hidden']").val();
    	   
         
    	//var IdUrl2=IdUrl+"price="+price+"&usernames="+usernames;  
    	 
         var price=$(".sumprice").attr("value");
         var url8="";
         
         
         url8=IdUrl+"price="+price+"&usernames="+usernames;
    	 
        //有问题，要调试 
         //OK!
    	//  alert(url8);
    	   
    	   $(".payform").attr("action",url8);   
    	   
    	   
    	/* var urls= $("form").attr("action");
    	 
    	 
    	 var arry=new Array(($(":checkbox:checked").length));
    	 
  
    	 
    	 for(var Id2=0;Id2<($(":checkbox:checked").length);Id2++){
    		 
    		 
    		 arry[Id2]=0;
    		 
    	 }*/
    	 
    	 
    	// $(".payform").attr("action",urls+"");
    	  
    	  
    	if(confirm("您确定要支付"+money+"元？")){
    		
   
    		
    		return true;
    		
    	}else{
    		
    		
    		
    		return false;
    	}
    	
    	return false;
    });
    

    
    //给用户提示删除；   
    
    
    $(".UserDao").click(function(){
    	
    	
    	if(confirm("您确定要移除当前选取的商品吗？")){
    		
    		
    		return true;
    	}else{
    		
    		
    		return false;
    	}
    	
    	return false;
    })
    
   
    
 
    
   
    
	
})