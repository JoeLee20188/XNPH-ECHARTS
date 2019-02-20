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
    <div id="curr_week_loan" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
    
    <script type="text/javascript">                      
            var myChart = echarts.init(document.getElementById('curr_week_loan'));  
            option = {
            	    title: {
            	        text: '小牛普惠最近一周的放款情况',
            	        subtext: 'From Xndb Database'
            	    },
            	    tooltip: {
            	        trigger: 'axis'
            	    },
            	    legend: {
            	        data:['放款笔数','合同金额']
            	    },
            	    toolbox: {
            	        show: true,
            	        feature: {
            	            dataZoom: {
            	                yAxisIndex: 'none'
            	            },
            	            dataView: {readOnly: false},
            	            magicType: {type: ['line', 'bar']},
            	            restore: {},
            	            saveAsImage: {}
            	        }
            	    },
            	    xAxis:  {
            	        type: 'category',
            	        boundaryGap: false,
            	        data: []
            	    },
            	    yAxis: {
            	        type: 'value',
            	        axisLabel: {
            	            formatter: '{value}'
            	        }
            	    },
            	    series: [
            	        {
            	            name:'放款笔数',
            	            type:'line',
            	            data:[],
            	            markPoint: {
            	                data: [
            	                    {type: 'max', name: '最大值'},
            	                    {type: 'min', name: '最小值'}
            	                ]
            	            },
            	            markLine: {
            	                data: [
            	                    {type: 'average', name: '平均值'}
            	                ]
            	            }
            	        },
            	        {
            	            name:'合同金额',
            	            type:'line',
            	            data:[],         
            	            markLine: {
            	                data: [
            	                    {type: 'average', name: '平均值'},
            	                    [{
            	                        symbol: 'none',
            	                        x: '90%',
            	                        yAxis: 'max'
            	                    }, {
            	                        symbol: 'circle',
            	                        label: {
            	                            normal: {
            	                                position: 'start',
            	                                formatter: '最大值'
            	                            }
            	                        },
            	                        type: 'max',
            	                        name: '最高点'
            	                    }]
            	                ]
            	            }
            	        }
            	    ]
            	};
            myChart.showLoading(); 
            $.ajax( {
        	    url:'GJ_curr_week_loan.jsp',
        	    type:'post',  
        	    cache:false,
        	    dataType:'json',
        	    success:function(result) {
        	    	myChart.hideLoading();
        	    	myChart.setOption(	
        	    			{
        	    				xAxis:[{data:result.loan_date}],
        	    				series: [
        	    				         {data:result.loan_num},
        	    				         {data:result.loan_money}
        	    				         ]
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