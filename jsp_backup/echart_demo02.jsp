<%@ page language="java" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML>  

<html>
  <head>
    <title>小牛普惠每省销量统计报表</title>  
    <script src="./js/echarts.js"></script> 
    <script src="./js/china.js"></script> 
	<script src="./js/jquery-1.7.2.min.js"></script>
  </head>  
  <body>    
    <div id="main" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
    
    <script type="text/javascript">                      
            var myChart = echarts.init(document.getElementById('main'));  
            option = {
                title: {
                    text: '普惠业绩概况',
                    subtext: '截至2016.6.13',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item'
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data:['小微贷','三农贷','网商贷','农商贷','互联网']
                },
                visualMap: {
                    min: 0,
                    max: 2500,
                    left: 'left',
                    top: 'bottom',
                    text: ['高','低'],           // 文本，默认为数值文本
                    calculable: true
                },
                toolbox: {
                    show: true,
                    orient: 'vertical',
                    left: 'right',
                    top: 'center',
                    feature: {
                        dataView: {readOnly: false},
                        restore: {},
                        saveAsImage: {}
                    }
                },
                series: [
                    {
                        name: '小微贷',
                        type: 'map',
                        mapType: 'china',
                        roam: false,
                        label: {
                            normal: {
                                show: true
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        scaleLimit:{min:0.8,max:1.1},
                        data:[]
                    },
                    {
                        name: '三农贷',
                        type: 'map',
                        mapType: 'china',
                        label: {
                            normal: {
                                show: true
                            },
                            emphasis: {
                                show: true
                            }
                        },
						data:[]
                    },
                    {
                        name: '网商贷',
                        type: 'map',
                        mapType: 'china',
                        label: {
                            normal: {
                                show: true
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data:[]                      
                    },
                    {
                        name: '农商贷',
                        type: 'map',
                        mapType: 'china',
                        label: {
                            normal: {
                                show: true
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data:[]                      
                    },
                    {
                        name: '互联网',
                        type: 'map',
                        mapType: 'china',
                        label: {
                            normal: {
                                show: true
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data:[]                      
                    }
                ]
            };  
            myChart.showLoading(); 
    		
    		$.ajax( {
        	    url:'GetJson02.jsp',
        	    type:'post',  
        	    cache:false,
        	    dataType:'json',
        	    success:function(result) {
        	    	myChart.hideLoading();
        	    	myChart.setOption(	
        	    			{
        	    				series: [
        	    				         {data:result.小微贷},
        	    				         {data:result.三农贷},
        	    				         {data:result.网商贷},
        	    				         {data:result.农商贷},
        	    				         {data:result.互联网}
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