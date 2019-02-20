<%@ page language="java" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML>  

<html>
  <head>
    <title>小牛普惠回款统计报表</title>  
    <script src="./js/echarts.js"></script> 
    <script src="./js/china.js"></script> 
	<script src="./js/jquery-1.7.2.min.js"></script>
  </head>  
  <body>    
    <div id="product_name" style="height:850px;border:1px solid #ccc;padding:10px;"></div>   
    
    <script type="text/javascript">                      
            var myChart04 = echarts.init(document.getElementById('product_name'));  
            option = {
            		title: {
                        text: '小牛普惠各产品总销售量',
                        subtext: 'Data From Xndb Database',
                        left: 'right'
                    },
            	    tooltip: {
            	        trigger: 'item',
            	        formatter: "{a} <br/>{b}: {c} ({d}%)"
            	    },
            	    legend: {
            	        orient: 'vertical',
            	        x: 'left',
            	        data:[]
            	    },
            	    series: [
            	        {
            	            name:'一级分类',
            	            type:'pie',
            	            selectedMode: 'single',
            	            radius: [0, '25%'],

            	            data:[]
            	        },
            	        {
            	            name:'二级分类',
            	            type:'pie',
            	            radius: ['40%', '55%'],
            	                       	         

            	            data:[]
            	        },
            	        {
            	            name:'三级分类',
            	            type:'pie',
            	            radius: ['70%', '85%'],

            	            data:[]
            	        }
            	    ]
            	};
				myChart04.showLoading(); 
        		
        		$.ajax( {
            	    url:'GJ_product_name.jsp',
            	    type:'post',  
            	    cache:false,
            	    dataType:'json',
            	    success:function(result) {
            	    	myChart04.hideLoading();
            	    	myChart04.setOption(	
            	    			{
            	    				legend:[{data:result.leng}],
            	    				series: [
            	    				         {data:result.S_data1},
            	    				         {data:result.S_data0},
            	    				         {data:result.S_data}
            	    				         ]
            	        }); 
            	    },  
            	     error : function() {  
            	          alert("异常！");  
            	     }  
            		});
        		myChart04.setOption(option);   
    </script>  
  </body>  
</html>