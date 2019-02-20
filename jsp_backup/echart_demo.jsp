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
  	<ul id="mulu">
  		<li><a href="#demo02">业绩概况</a> <a href="#">图标四</a></li>
  		<li><a href="#">图表二</a></li>
  		<li><a href="#">图表三</a></li>
  		
  	</ul>
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
    <a href="#mulu">返回目录</a>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <div id="demo02" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
 	
    <script type="text/javascript">                      
            var myChart1 = echarts.init(document.getElementById('demo02'));  
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
            myChart1.showLoading(); 
    		
    		$.ajax( {
        	    url:'GetJson02.jsp',
        	    type:'post',  
        	    cache:false,
        	    dataType:'json',
        	    success:function(result) {
        	    	myChart1.hideLoading();
        	    	myChart1.setOption(	
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
				
        		myChart1.setOption(option);   
    </script> 
        <a href="#mulu">返回目录</a>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <div id="demo03" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
    <script type="text/javascript">                      
            var myChart = echarts.init(document.getElementById('demo03'));  
            var option = {
                tooltip: {
                    trigger: 'axis',
                    position: function (pt) {
                        return [pt[0], '10%'];
                    }
                },
                title: {
                    left: 'center',
                    text: '小牛普惠每日回款图',
                },
                legend: {
                    top: 'bottom',
                    data:['意向']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: []
                },
                yAxis: {
                    type: 'value',
                    boundaryGap: [0, '100%']
                },
                dataZoom: [{
                    type: 'inside',
                    start: 0,
                    end: 10
                }, {
                    start: 0,
                    end: 10
                }],
                series: [
                    {
                        name:'今日回款（万元）',
                        type:'line',
                        smooth:true,
                        symbol: 'none',
                        sampling: 'average',
                        itemStyle: {
                            normal: {
                                color: 'rgb(255, 70, 131)'
                            }
                        },
                        areaStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                    offset: 0,
                                    color: 'rgb(255, 158, 68)'
                                }, {
                                    offset: 1,
                                    color: 'rgb(255, 70, 131)'
                                }])
                            }
                        },
                        data: []
                    }
                ]
            };
				myChart.showLoading(); 
        		
        		$.ajax( {
            	    url:'GetJson03.jsp',
            	    type:'post',  
            	    cache:false,
            	    dataType:'json',
            	    success:function(result) {
            	    	myChart.hideLoading();
            	    	myChart.setOption(	
            	    			{
            	    				xAxis:[{data:result.X_seri}],
            	    				series: [
            	    				         {data:result.money}
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