<%@ page language="java" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML>  

<html>
  <head>
    <title>小牛普惠今日概况</title>  
    <script src="./js/echarts.js"></script> 
    <script src="./js/china.js"></script> 
	<script src="./js/jquery-1.7.2.min.js"></script>
  </head>  
  <body>    
    <div id="today" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
    
    <script type="text/javascript">                      
            var myChart06 = echarts.init(document.getElementById('today'));  
            var option = {
            	    title: {
            	        text: '今月概况',
            	        subtext: 'Data From Xndb Database'
            	    },
            	    tooltip: {
            	        trigger: 'axis',
            	        axisPointer: {
            	            type: 'shadow'
            	        }
            	    },
            	    legend: {
            	        data: ['申请件数', '放款件数','合同金额']
            	    },
            	    grid: {
            	        left: '3%',
            	        right: '4%',
            	        bottom: '3%',
            	        containLabel: true
            	    },
            	    xAxis: {
            	        type: 'value',
            	        boundaryGap: [0, 0.01]
            	    },
            	    yAxis: {
            	        type: 'category',
            	        data: []
            	    },
            	    series: [
            	        {
            	            name: '申请件数',
            	            type: 'bar',
            	            data: []
            	        },
            	        {
            	            name: '放款件数',
            	            type: 'bar',
            	            data: []
            	        },
            	        {
            	            name: '合同金额',
            	            type: 'bar',
            	            data: []
            	        },
            	    ]
            	};
				myChart06.showLoading(); 
        		
        		$.ajax( {
            	    url:'GJ_tomonth.jsp',
            	    type:'post',  
            	    cache:false,
            	    dataType:'json',
            	    success:function(result) {
            	    	myChart06.hideLoading();
            	    	myChart06.setOption(	
            	    			{
            	    				yAxis:[{data:result.syb}],
            	    				series: [
            	    				         {data:result.apply},
            	    				         {data:result.loan_num},
            	    				         {data:result.loan_money}
            	    				         ]
            	        }); 
            	    },  
            	     error : function() {  
            	          alert("异常！");  
            	     }  
            		});
        		myChart06.setOption(option);   
    </script>  
  </body>  
</html>