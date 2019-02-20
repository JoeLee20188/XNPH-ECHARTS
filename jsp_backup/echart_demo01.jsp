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
    <div id="mainBar" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
    
    <script type="text/javascript">                      
            var myChart = echarts.init(document.getElementById('mainBar'));  
            var option = {
            		title: {   
                    text: '小牛普惠每月回款统计报表',  
                    link: '\n',
                    subtext: 'xnph',  
                    sublink: '\n',  
                    x: 'left',  
                    y: 'top'  
                },  
                tooltip: {  
                    trigger: 'axis'  
                },  
                legend: {  
                    show: true,  
                    x: 'center',  
                    y: 'top',  
                    data: ['2014年','2015年','2016年']  
                },  
                toolbox: {  
                    show: true,  
                    feature: {  
                        mark: {show: true},  
                        dataZoom: {  
                            show: true,  
                             title: {  
                                dataZoom: '区域缩放',  
                                dataZoomReset: '区域缩放后退'  
                            }  
                        },  
                        dataView: {show: true, readOnly: true},  
                        magicType: {show: true, type: ['line', 'bar']},  
                        restore: {show: true},  
                        saveAsImage: {show: true}  
                    }  
                },  
                calculable: true,  
                xAxis: [  
                    {  
                        show: true,  
                        type: 'category',  
               			data:[]
                      
                    }  
                ],  
                yAxis: [  
                    {  
                        show: true,  
                        type: 'value',  
                        splitArea: {show: true}  
                    }  
                ],  
                series: [  
                    {  
                        name: '2014年',  
                        type: 'bar',  
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
                        name: '2015年',  
                        type: 'bar',  
                        data: [],  
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
                    name: '2016年',  
                    type: 'bar',  
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
					}
                ]  
            };  
				myChart.showLoading(); 
        		
        		$.ajax( {
            	    url:'GetJson01.jsp',
            	    type:'post',  
            	    cache:false,
            	    dataType:'json',
            	    success:function(result) {
            	    	myChart.hideLoading();
            	    	myChart.setOption(	
            	    			{
            	    				xAxis:[{data:result.X_seri}],
            	    				series: [
            	    				         {data:result.n2014},
            	    				         {data:result.n2015},
            	    				         {data:result.n2016}
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