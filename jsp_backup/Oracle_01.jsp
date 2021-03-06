<%@ page language="java" pageEncoding="UTF-8"%>  
<!DOCTYPE HTML>  

<html>
  <head>
    <title>小牛普惠各城市申请量</title>  
    <script src="./js/echarts.js"></script> 
    <script src="./js/china.js"></script> 
	<script src="./js/jquery-1.7.2.min.js"></script>
  </head>  
  <body>    
    <div id="xnph" style="height:500px;border:1px solid #ccc;padding:10px;"></div>   
    
    <script type="text/javascript">                      
            var myChart = echarts.init(document.getElementById('xnph'));  
            $.ajax( {
        	    url:'GJ_Oracel_test.jsp',
        	    type:'post',  
        	    cache:false,
        	    dataType:'json',
        	    success:function(result) {
        	    	alert("连接数据库成功");  
        	    	var data = result;
                    var geoCoordMap = {
                 		   "清远":[113.03,23.7],
                 		   "许昌":[113.85,34.03],
                 		   "常州":[119.95,31.78],
                 		   "秦皇岛":[119.6,39.93],
                 		   "汕头":[116.68,23.35],
                 		   "宜宾":[104.62,28.77],
                 		   "西安":[108.93,34.27],
                 		   "淄博":[118.05,36.82],
                 		   "抚顺":[123.98,41.88],
                 		   "苏州":[120.58,31.3],
                 		   "南昌":[115.85,28.68],
                 		   "南宁":[108.37,22.82],
                 		   "河源":[114.7,23.73],
                 		   "襄阳":[112.2,32.08],
                 		   "万州":[108.4,30.82],
                 		   "揭阳":[116.37,23.55],
                 		   "通辽":[122.27,43.62],
                 		   "张家口":[114.88,40.82],
                 		   "益阳":[112.32,28.6],
                 		   "德州":[116.3,37.45],
                 		   "河池":[108.07,24.7],
                 		   "吉首":[109.73,28.32],
                 		   "榆林":[109.73,38.28],
                 		   "朝阳":[120.45,41.57],
                 		   "通化":[125.93,41.73],
                 		   "巴彦淖尔":[107.42,40.75],
                 		   "本溪":[123.77,41.3],
                 		   "诸暨":[120.23,29.72],
                 		   "吉安":[114.98,27.12],
                 		   "南平":[118.17,26.65],
                 		   "杭州":[120.15,30.28],
                 		   "长沙":[112.93,28.23],
                 		   "深圳":[114.05,22.55],
                 		   "漳州":[117.65,24.52],
                 		   "鞍山":[122.98,41.1],
                 		   "珠海":[113.57,22.27],
                 		   "北京":[116.4,39.9],
                 		   "扬州":[119.4,32.4],
                 		   "武汉":[114.3,30.6],
                 		   "钦州":[108.62,21.95],
                 		   "东莞":[113.75,23.05],
                 		   "柳州":[109.42,24.33],
                 		   "唐山":[118.2,39.63],
                 		   "常德":[111.68,29.05],
                 		   "太原":[112.55,37.87],
                 		   "六盘水":[104.83,26.6],
                 		   "齐齐哈尔":[123.95,47.33],
                 		   "郴州":[113.02,25.78],
                 		   "永州":[111.62,26.43],
                 		   "玉林":[110.17,22.63],
                 		   "宜春":[114.38,27.8],
                 		   "荆州":[112.23,30.33],
                 		   "枣庄":[117.32,34.82],
                 		   "沧州":[116.83,38.3],
                 		   "聊城":[115.98,36.45],
                 		   "重庆":[106.55,29.57],
                 		   "沈阳":[123.43,41.8],
                 		   "宜昌":[111.28,30.7],
                 		   "天津":[117.2,39.12],
                 		   "海口":[110.32,20.03],
                 		   "中山":[113.38,22.52],
                 		   "玉溪":[102.55,24.35],
                 		   "包头":[109.83,40.65],
                 		   "大连":[121.62,38.92],
                 		   "九江":[116,29.7],
                 		   "潍坊":[119.15,36.7],
                 		   "肇庆":[112.47,23.05],
                 		   "兰州":[103.82,36.07],
                 		   "梧州":[111.27,23.48],
                 		   "博罗":[114.28,23.18],
                 		   "威海":[122.12,37.52],
                 		   "梅州":[116.12,24.28],
                 		   "连云港":[119.22,34.6],
                 		   "呼伦贝尔":[119.77,49.22],
                 		   "绥化":[126.98,46.63],
                 		   "佳木斯":[130.37,46.82],
                 		   "安康":[109.02,32.68],
                 		   "广州":[113.27,23.13],
                 		   "青岛":[120.38,36.07],
                 		   "南阳":[112.52,33],
                 		   "株洲":[113.13,27.83],
                 		   "咸阳":[108.7,34.33],
                 		   "厦门":[118.08,24.48],
                 		   "无锡":[120.3,31.57],
                 		   "绍兴":[120.57,30],
                 		   "泰安":[117.08,36.2],
                 		   "常熟":[120.75,31.65],
                 		   "江门":[113.08,22.58],
                 		   "桂林":[110.28,25.28],
                 		   "赤峰":[118.92,42.27],
                 		   "新密":[113.38,34.53],
                 		   "丽水":[119.92,28.45],
                 		   "庆阳":[107.63,35.73],
                 		   "乌兰察布":[113.12,40.98],
                 		   "乌海":[106.82,39.67],
                 		   "盘锦":[122.07,41.12],
                 		   "延吉":[129.5,42.88],
                 		   "兴义":[104.9,25.08],
                 		   "惠州":[114.42,23.12],
                 		   "上海":[121.47,31.23],
                 		   "徐州":[117.18,34.27],
                 		   "合肥":[117.25,31.83],
                 		   "郑州":[113.62,34.75],
                 		   "赣州":[114.93,25.83],
                 		   "龙岩":[117.03,25.1],
                 		   "昆山":[120.98,31.38],
                 		   "保定":[115.47,38.87],
                 		   "晋中":[112.75,37.68],
                 		   "贵港":[109.6,23.1],
                 		   "北海":[109.12,21.48],
                 		   "石嘴山":[106.38,39.02],
                 		   "铁岭":[123.83,42.28],
                 		   "蚌埠":[117.38,32.92],
                 		   "济源":[112.58,35.07],
                 		   "成都":[104.07,30.67],
                 		   "江阴":[120.27,31.9],
                 		   "昆明":[102.72,25.05],
                 		   "宁波":[121.55,29.88],
                 		   "石家庄":[114.52,38.05],
                 		   "吉林":[126.55,43.83],
                 		   "贵阳":[106.63,26.65],
                 		   "黄石":[115.03,30.2],
                 		   "南通":[120.88,31.98],
                 		   "济南":[116.98,36.67],
                 		   "泉州":[118.67,24.88],
                 		   "温州":[120.7,28],
                 		   "烟台":[121.43,37.45],
                 		   "临沂":[118.35,35.05],
                 		   "湖州":[120.08,30.9],
                 		   "日照":[119.52,35.42],
                 		   "十堰":[110.78,32.65],
                 		   "黄冈":[114.87,30.45],
                 		   "龙海":[117.82,24.45],
                 		   "茂名":[110.92,21.67],
                 		   "盐城":[120.15,33.35],
                 		   "宿迁":[118.28,33.97],
                 		   "潮州":[116.62,23.67],
                 		   "乌兰浩特":[122.05,46.08],
                 		   "晋江":[118.58,24.82],
                 		   "铜仁":[109.18,27.72],
                 		   "滁州":[118.32,32.3],
                 		   "大同":[113.3,40.08],
                 		   "东营":[118.67,37.43],
                 		   "承德":[117.93,40.97],
                 		   "长春":[125.32,43.9],
                 		   "泰州":[119.92,32.45],
                 		   "马鞍山":[118.5,31.7],
                 		   "曲靖":[103.8,25.5],
                 		   "福州":[119.3,26.08],
                 		   "湛江":[110.35,21.27],
                 		   "宝鸡":[107.13,34.37],
                 		   "红河":[103.4,23.37],
                 		   "葫芦岛":[120.83,40.72],
                 		   "菏泽":[115.41,35.26],
                 		   "怀化":[110,27.57],
                 		   "临汾":[111.52,36.08],
                 		   "开封":[114.3,34.8],
                 		   "娄底":[112,27.73],
                 		   "银川":[106.28,38.47],
                 		   "锦州":[121.13,41.1],
                 		   "大庆":[125.03,46.58],
                 		   "湘潭":[112.93,27.83],
                 		   "安顺":[105.95,26.25],
                 		   "四平":[124.35,43.17],
                 		   "阜新":[121.67,42.02],
                 		   "延安":[109.48,36.6],
                 		   "廊坊":[116.7,39.52],
                 		   "巴中":[106.77,31.85],
                 		   "哈尔滨":[126.53,45.8],
                 		   "营口":[122.23,40.67],
                 		   "芜湖":[118.38,31.33],
                 		   "南京":[118.78,32.07],
                 		   "济宁":[116.58,35.42],
                 		   "佛山":[113.12,23.02],
                 		   "凯里":[107.97,26.58],
                 		   "邯郸":[114.48,36.62],
                 		   "呼和浩特":[111.73,40.83],
                 		   "遵义":[106.92,27.73],
                 		   "衡阳":[112.57,26.9],
                 		   "上饶":[117.97,28.45],
                 		   "南充":[106.08,30.78],
                 		   "三明":[117.62,26.27],
                 		   "淮安":[119.02,33.62],
                 		   "金华":[119.65,29.08],
                 		   "嘉兴":[120.75,30.75],
                 		   "达州":[107.5,31.22],
                 		   "牡丹江":[129.6,44.58],
                 		   "衡水":[115.68,37.73],
                 		   "自贡":[104.78,29.35],
                 		   "百色":[106.62,23.9],
                 		   "阳江":[111.98,21.87],
                 		   "吴忠":[106.2,37.98],
                 		   "荆门":[112.2,31.03],
                 		   "白城":[122.83,45.62],
                 		   "辽阳":[123.17,41.27],
                 		   "随州":[113.37,31.72],
                 		   "大理":[100.23,25.6]
                    };

                    var convertData = function (data) {
                        var res = [];
                        for (var i = 0; i < data.length; i++) {
                            var geoCoord = geoCoordMap[data[i].name];
                            if (geoCoord) {
                                res.push({
                                    name: data[i].name,
                                    value: geoCoord.concat(data[i].value)
                                });
                            }
                        }
                        return res;
                    };

                    option = {
                        backgroundColor: '#404a59',
                        title: {
                            text: '小牛普惠全国各城市进件量',
                            subtext: 'data from 新系统数据库',
                            sublink: 'http://cas.xnph66.com/app/login',
                            left: 'center',
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        tooltip : {
                            trigger: 'item'
                        },
                        toolbox: {
                            feature: {
                                dataView: {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore: {show: true},
                                saveAsImage: {show: true}
                            }
                        },
                        legend: {
                            orient: 'vertical',
                            y: 'bottom',
                            x:'right',
                            data:['全国各城市进件量'],
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        geo: {
                            map: 'china',
                            label: {
                                emphasis: {
                                    show: false
                                }
                            },
                            roam: true,
                            itemStyle: {
                                normal: {
                                    areaColor: '#323c48',
                                    borderColor: '#111'
                                },
                                emphasis: {
                                    areaColor: '#2a333d'
                                }
                            }
                        },
                        series : [
                            {
                                name: '全国各城市进件量',
                                type: 'scatter',
                                coordinateSystem: 'geo',
                                data: convertData(data),
                                symbolSize: function (val) {
                                    return val[2] / 1000;
                                },
                                label: {
                                    normal: {
                                        formatter: '{b}',
                                        position: 'right',
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                itemStyle: {
                                    normal: {
                                        color: '#ddb926'
                                    }
                                }
                            },
                            {
                                name: 'Top 5',
                                type: 'effectScatter',
                                coordinateSystem: 'geo',
                                data: convertData(data.sort(function (a, b) {
                                    return b.value - a.value;
                                }).slice(0, 6)),
                                symbolSize: function (val) {
                                    return val[2] / 1000;
                                },
                                showEffectOn: 'render',
                                rippleEffect: {
                                    brushType: 'stroke'
                                },
                                hoverAnimation: true,
                                label: {
                                    normal: {
                                        formatter: '{b}',
                                        position: 'right',
                                        show: true
                                    }
                                },
                                itemStyle: {
                                    normal: {
                                        color: '#f4e925',
                                        shadowBlur: 10,
                                        shadowColor: '#333'
                                    }
                                },
                                zlevel: 1
                            }    
                        ]
                    };
                    myChart.setOption(option);
        	    	
        	    },  
        	     error : function() {  
        	          alert("xndb数据库异常！");  
        	     }  
        		});         
    </script>  
    <a href="GetExcel01.jsp">下载数据</a>
  </body>  
</html>