<%@ page language="java" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML>  

<html>
  <head>
    <title>近一周放款量</title>  
    <script src="./js/echarts.js"></script> 
    <script src="./js/china.js"></script> 
	<script src="./js/jquery-1.7.2.min.js"></script>
  </head>  
  <body>    
    <div id="dachenglv" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
    
    <script type="text/javascript">                      
            var myChart = echarts.init(document.getElementById('dachenglv'));  
            option = {
            	    tooltip : {
            	        formatter: "{a} <br/>{b} : {c}%"
            	    },
            	    toolbox: {
            	        feature: {
            	            restore: {},
            	            saveAsImage: {}
            	        }
            	    },
            	    series: [
            	        {
            	            name: '目标166亿',
            	            type: 'gauge',
            	            detail: {formatter:'{value}%'},
            	            data: []
            	        }
            	    ]
            	};
            myChart.showLoading(); 
    		
    		$.ajax( {
        	    url:'GJ_dachenglv.jsp',
        	    type:'post',  
        	    cache:false,
        	    dataType:'json',
        	    success:function(result) {
        	    	myChart.hideLoading();
        	    	myChart.setOption(	
        	    			{
        	    				series: [{data:result}]
        	        }); 
        	    },  
        	     error : function() {  
        	          alert("异常！");  
        	     }  
        		});
    		myChart.setOption(option); 
    </script>  
  </body>  
</html>