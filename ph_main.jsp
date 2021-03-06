<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>小牛普惠经营状况</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <script src="./js/echarts.js"></script>
    <script src="./js/china.js"></script>
	<script src="./js/roma.js"></script>
    <script src="./js/jquery-3.1.0.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</head>
<body style="padding-top: 60px;">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">小牛普惠DataWeb</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        业务快报<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="./daily_report.jsp">普惠总览</a></li>
                        <li><a href="./daily_report_xw.jsp">小微贷</a></li>
                        <li><a href="./daily_report_sn.jsp">三农贷</a></li>
                        <li><a href="./daily_report_ns.jsp">农商贷</a></li>
                        <li><a href="./daily_report_hlw.jsp">互联网</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        经营分析 （开发ing）<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="./indextest.jsp">月度分析报告</a></li>
                        <li><a href="#">客户专题报告</a></li>
                        <li class="divider"></li>
                        <li><a href="#">产品专题报告</a></li>
                        <li><a href="#">门店专题报告</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">月结报表（开发ing）<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">事业部报表</a></li>
                        <li><a href="#">门店报表</a></li>
                        <li><a href="#">产品报表</a></li>
                        <li><a href="#">逾期报表</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div id="dachenglv" style="height: 400px;"></div>
        </div>
        <div class="col-lg-6">
            <div>
                <div id="curr_week_loan" style="height: 400px;"></div>
            </div>
        </div>
    </div>
    <div class="row" style="width: 100%;height: 10px;"></div>
    <div class="row">
        <div class="col-lg-6">
            <div id="today" style="height: 400px;"></div>
        </div>
        <div class="col-lg-6">
            <div id="tomonth" style="height: 400px;"></div>
        </div>
    </div>
    <div class="row" style="width: 100%;height: 10px;"></div>
    <div class="row">
        <div class="col-lg-6">
            <div id="tomonth_product_money" style="height: 400px;"></div>
        </div>
        <div class="col-lg-6">
            <div id="product_money" style="height: 400px;"></div>
        </div>
    </div>
    <div class="row" style="width: 100%;height: 10px;"></div>
    <div class="row">
        <div id="today_city_mon" style="height: 600px;"></div>
    </div>
    <div class="row" style="width: 100%;height: 10px;"></div>
    <div class="row">
        <div id="city_mon" style="height: 600px;"></div>       
    </div>
</div>
</body>
<script type="text/javascript">
		function myChart01(){
		var myChart01 = echarts.init(document.getElementById('today'),'roma');
		var option = {
		    title: {
		        text: '今日概况',
		        subtext: 'Data From Xndb Database'
		    },
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'shadow'
		        }
		    },
		    legend: {
		    	x: 'right',
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
		        boundaryGap: [0, 0.01],
		        splitLine: {
	                show: false
	            }
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
		myChart01.showLoading();
	
	$.ajax( {
	    url:'GetJson/GJ_today.jsp',
	    type:'post',
	    cache:false,
	    dataType:'json',
	    success:function(result) {
	        myChart01.hideLoading();
	        myChart01.setOption(
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
	        alert("本页面数据未加载...！");
	    }
	});
	myChart01.setOption(option);}
		</script>
	<script type="text/javascript">
	function myChart02(){
	var myChart02 = echarts.init(document.getElementById('tomonth'),'roma');
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
	    	x: 'right',
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
	        boundaryGap: [0, 0.01],
	        splitLine: {
                show: false
            }
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
	myChart02.showLoading();
	
	$.ajax( {
	    url:'GetJson/GJ_tomonth.jsp',
	    type:'post',
	    cache:false,
	    dataType:'json',
	    success:function(result) {
	        myChart02.hideLoading();
	        myChart02.setOption(
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
	        alert("本页面数据未加载...！");
	    }
	});
	myChart02.setOption(option);}
	</script>
	<script type="text/javascript">
	function myChart03(){
	var myChart03 = echarts.init(document.getElementById('dachenglv'),'roma');
	option = {
	    title: {
	        text: '小牛普惠2016年达成率',
	        subtext: 'From Xndb Database',
	        sublink: 'http://cas.xnph66.com/app/login',
	    },
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
	myChart03.showLoading();
	
	$.ajax( {
	    url:'GetJson/GJ_dachenglv.jsp',
	    type:'post',
	    cache:false,
	    dataType:'json',
	    success:function(result) {
	        myChart03.hideLoading();
	        myChart03.setOption(
	                {
	                    series: [{data:result}]
	                });
	    },
	    error : function() {
	        alert("本页面数据未加载...！");
	    }
	});
	myChart03.setOption(option);}
	</script>
	<script type="text/javascript">
	function myChart04(){
	var myChart04 = echarts.init(document.getElementById('curr_week_loan'),'roma');
	option = {
	    title: {
	        text: '小牛普惠最近一周的放款情况',
	        subtext: 'From Xndb Database'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	    	x: 'right',
	        data:['放款笔数','合同金额']
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
	        },
	        splitLine: {
                show: false
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
	myChart04.showLoading();
	$.ajax( {
	    url:'GetJson/GJ_curr_week_loan.jsp',
	    type:'post',
	    cache:false,
	    dataType:'json',
	    success:function(result) {
	        myChart04.hideLoading();
	        myChart04.setOption(
	                {
	                    xAxis:[{data:result.loan_date}],
	                    series: [
	                        {data:result.loan_num},
	                        {data:result.loan_money}
	                    ]
	                });
	    },
	    error : function() {
	        alert("本页面数据未加载...！");
	    }
	});
	myChart04.setOption(option);}
	</script>
	  <script type="text/javascript">                      
            var myChart05 = echarts.init(document.getElementById('today_city_mon'));  
            $.ajax( {
        	    url:'GetJson/GJ_today_city_money.jsp',
        	    type:'post',  
        	    cache:false,
        	    dataType:'json',
        	    success:function(result) {
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
            	            "大理":[100.23,25.6],
            	            "岳阳":[113.09,29.37]
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

                    var convertedData = [
                        convertData(data),
                        convertData(data.sort(function (a, b) {
                            return b.value - a.value;
                        }).slice(0, 6))
                    ];


                    option = {
                        backgroundColor: '#404a59',
                        animation: true,
                        animationDuration: 1000,
                        animationEasing: 'cubicInOut',
                        animationDurationUpdate: 1000,
                        animationEasingUpdate: 'cubicInOut',
                        title: [
                            {
                                text: '普惠今日各城市总销量',
                                subtext: 'Data From Xndb Database',
                                sublink: 'http://cas.xnph66.com/app/login',
                                left: 'center',
                                textStyle: {
                                    color: '#fff'
                                }
                            },
                            {
                                id: 'statistic',
                                right: 120,
                                top: 40,
                                width: 100,
                                textStyle: {
                                    color: '#fff',
                                    fontSize: 16
                                }
                            }
                        ],
                        toolbox: {
                            iconStyle: {
                                normal: {
                                    borderColor: '#fff'
                                },
                                emphasis: {
                                    borderColor: '#b1e4ff'
                                }
                            }
                        },
                        brush: {
                            outOfBrush: {
                                color: '#abc'
                            },
                            brushStyle: {
                                borderWidth: 2,
                                color: 'rgba(0,0,0,0.2)',
                                borderColor: 'rgba(0,0,0,0.5)',
                            },
                            seriesIndex: [0, 1],
                            throttleType: 'debounce',
                            throttleDelay: 300,
                            geoIndex: 0
                        },
                        geo: {
                            map: 'china',
                            left: '10',
                            right: '35%',
                            center: [117.98561551896913, 31.205000490896193],
                            zoom: 2.5,
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
                        tooltip : {
                            trigger: 'item'
                        },
                        grid: {
                            right: 40,
                            top: 100,
                            bottom: 40,
                            width: '30%'
                        },
                        xAxis: {
                            type: 'value',
                            scale: true,
                            position: 'top',
                            boundaryGap: false,
                            splitLine: {show: false},
                            axisLine: {show: false},
                            axisTick: {show: false},
                            axisLabel: {margin: 2, textStyle: {color: '#aaa'}},
                        },
                        yAxis: {
                            type: 'category',
                            name: 'TOP 20',
                            nameGap: 16,
                            axisLine: {show: false, lineStyle: {color: '#ddd'}},
                            axisTick: {show: false, lineStyle: {color: '#ddd'}},
                            axisLabel: {interval: 0, textStyle: {color: '#ddd'}},
                            data: []
                        },
                        series : [
                            {
                                name: 'pm2.5',
                                type: 'scatter',
                                coordinateSystem: 'geo',
                                data: convertedData[0],
                                symbolSize: function (val) {
                                    return Math.max(val[2] / 10, 8);
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
                                data: convertedData[1],
                                symbolSize: function (val) {
                                    return Math.max(val[2] / 10, 8);
                                },
                                showEffectOn: 'emphasis',
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
                            },
                            {
                                id: 'bar',
                                zlevel: 2,
                                type: 'bar',
                                symbol: 'none',
                                itemStyle: {
                                    normal: {
                                        color: '#ddb926'
                                    }
                                },
                                data: []
                            }
                        ]
                    };


                    myChart05.on('brushselected', renderBrushed);

                     myChart05.setOption(option);

                    setTimeout(function () {
                        myChart05.dispatchAction({
                            type: 'brush',
                            areas: [
                                {
                                    geoIndex: 0,
                                    brushType: 'polygon',
                                    coordRange: [[119.72,34.85],[119.68,34.85],[119.5,34.84],[119.19,34.77],[118.76,34.63],[118.6,34.6],[118.46,34.6],[118.33,34.57],[118.05,34.56],[117.6,34.56],[117.41,34.56],[117.25,34.56],[117.11,34.56],[117.02,34.56],[117,34.56],[116.94,34.56],[116.94,34.55],[116.9,34.5],[116.88,34.44],[116.88,34.37],[116.88,34.33],[116.88,34.24],[116.92,34.15],[116.98,34.09],[117.05,34.06],[117.19,33.96],[117.29,33.9],[117.43,33.8],[117.49,33.75],[117.54,33.68],[117.6,33.65],[117.62,33.61],[117.64,33.59],[117.68,33.58],[117.7,33.52],[117.74,33.5],[117.74,33.46],[117.8,33.44],[117.82,33.41],[117.86,33.37],[117.9,33.3],[117.9,33.28],[117.9,33.27],[118.09,32.97],[118.21,32.7],[118.29,32.56],[118.31,32.5],[118.35,32.46],[118.35,32.42],[118.35,32.36],[118.35,32.34],[118.37,32.24],[118.37,32.14],[118.37,32.09],[118.44,32.05],[118.46,32.01],[118.54,31.98],[118.6,31.93],[118.68,31.86],[118.72,31.8],[118.74,31.78],[118.76,31.74],[118.78,31.7],[118.82,31.64],[118.82,31.62],[118.86,31.58],[118.86,31.55],[118.88,31.54],[118.88,31.52],[118.9,31.51],[118.91,31.48],[118.93,31.43],[118.95,31.4],[118.97,31.39],[118.97,31.37],[118.97,31.34],[118.97,31.27],[118.97,31.21],[118.97,31.17],[118.97,31.12],[118.97,31.02],[118.97,30.93],[118.97,30.87],[118.97,30.85],[118.95,30.8],[118.95,30.77],[118.95,30.76],[118.93,30.7],[118.91,30.63],[118.91,30.61],[118.91,30.6],[118.9,30.6],[118.88,30.54],[118.88,30.51],[118.86,30.51],[118.86,30.46],[118.72,30.18],[118.68,30.1],[118.66,30.07],[118.62,29.91],[118.56,29.73],[118.52,29.63],[118.48,29.51],[118.44,29.42],[118.44,29.32],[118.43,29.19],[118.43,29.14],[118.43,29.08],[118.44,29.05],[118.46,29.05],[118.6,28.95],[118.64,28.94],[119.07,28.51],[119.25,28.41],[119.36,28.28],[119.46,28.19],[119.54,28.13],[119.66,28.03],[119.78,28],[119.87,27.94],[120.03,27.86],[120.17,27.79],[120.23,27.76],[120.3,27.72],[120.42,27.66],[120.52,27.64],[120.58,27.63],[120.64,27.63],[120.77,27.63],[120.89,27.61],[120.97,27.6],[121.07,27.59],[121.15,27.59],[121.28,27.59],[121.38,27.61],[121.56,27.73],[121.73,27.89],[122.03,28.2],[122.3,28.5],[122.46,28.72],[122.5,28.77],[122.54,28.82],[122.56,28.82],[122.58,28.85],[122.6,28.86],[122.61,28.91],[122.71,29.02],[122.73,29.08],[122.93,29.44],[122.99,29.54],[123.03,29.66],[123.05,29.73],[123.16,29.92],[123.24,30.02],[123.28,30.13],[123.32,30.29],[123.36,30.36],[123.36,30.55],[123.36,30.74],[123.36,31.05],[123.36,31.14],[123.36,31.26],[123.38,31.42],[123.46,31.74],[123.48,31.83],[123.48,31.95],[123.46,32.09],[123.34,32.25],[123.22,32.39],[123.12,32.46],[123.07,32.48],[123.05,32.49],[122.97,32.53],[122.91,32.59],[122.83,32.81],[122.77,32.87],[122.71,32.9],[122.56,32.97],[122.38,33.05],[122.3,33.12],[122.26,33.15],[122.22,33.21],[122.22,33.3],[122.22,33.39],[122.18,33.44],[122.07,33.56],[121.99,33.69],[121.89,33.78],[121.69,34.02],[121.66,34.05],[121.64,34.08]]
                                }
                            ]
                        });
                    }, 0);


                    function renderBrushed(params) {
                        var mainSeries = params.batch[0].selected[0];

                        var selectedItems = [];
                        var categoryData = [];
                        var barData = [];
                        var maxBar = 30;
                        var sum = 0;
                        var count = 0;

                        for (var i = 0; i < mainSeries.dataIndex.length; i++) {
                            var rawIndex = mainSeries.dataIndex[i];
                            var dataItem = convertedData[0][rawIndex];
                            var pmValue = dataItem.value[2];

                            sum += pmValue;
                            count++;

                            selectedItems.push(dataItem);
                        }

                        selectedItems.sort(function (a, b) {
                            return a.value[2] - b.value[2];
                        });

                        for (var i = 0; i < Math.min(selectedItems.length, maxBar); i++) {
                            categoryData.push(selectedItems[i].name);
                            barData.push(selectedItems[i].value[2]);
                        }

                        this.setOption({
                            yAxis: {
                                data: categoryData
                            },
                            xAxis: {
                                axisLabel: {show: !!count}
                            },
                            title: {
                                id: 'statistic',
                                text: count ? '平均: ' + (sum / count).toFixed(4) : ''
                            },
                            series: {
                                id: 'bar',
                                data: barData
                            }
                        });
                    }
        	    },  
        	     error : function() {  
        	          alert("xndb数据库异常！");  
        	     }  
        		});
	</script>    
	<script type="text/javascript">                      
            var myChart06 = echarts.init(document.getElementById('city_mon'));  
            $.ajax( {
        	    url:'GetJson/GJ_city_money.jsp',
        	    type:'post',  
        	    cache:false,
        	    dataType:'json',
        	    success:function(result) {
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
            	            "大理":[100.23,25.6],
            	            "岳阳":[113.09,29.37]
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

                    var convertedData = [
                        convertData(data),
                        convertData(data.sort(function (a, b) {
                            return b.value - a.value;
                        }).slice(0, 6))
                    ];


                    option = {
                        backgroundColor: '#404a59',
                        animation: true,
                        animationDuration: 1000,
                        animationEasing: 'cubicInOut',
                        animationDurationUpdate: 1000,
                        animationEasingUpdate: 'cubicInOut',
                        title: [
                            {
                                text: '普惠全国各城市总销量',
                                subtext: 'Data From Xndb Database',
                                sublink: 'http://cas.xnph66.com/app/login',
                                left: 'center',
                                textStyle: {
                                    color: '#fff'
                                }
                            },
                            {
                                id: 'statistic',
                                right: 120,
                                top: 40,
                                width: 100,
                                textStyle: {
                                    color: '#fff',
                                    fontSize: 16
                                }
                            }
                        ],
                        toolbox: {
                            iconStyle: {
                                normal: {
                                    borderColor: '#fff'
                                },
                                emphasis: {
                                    borderColor: '#b1e4ff'
                                }
                            }
                        },
                        brush: {
                            outOfBrush: {
                                color: '#abc'
                            },
                            brushStyle: {
                                borderWidth: 2,
                                color: 'rgba(0,0,0,0.2)',
                                borderColor: 'rgba(0,0,0,0.5)',
                            },
                            seriesIndex: [0, 1],
                            throttleType: 'debounce',
                            throttleDelay: 300,
                            geoIndex: 0
                        },
                        geo: {
                            map: 'china',
                            left: '10',
                            right: '35%',
                            center: [117.98561551896913, 31.205000490896193],
                            zoom: 2.5,
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
                        tooltip : {
                            trigger: 'item'
                        },
                        grid: {
                            right: 40,
                            top: 100,
                            bottom: 40,
                            width: '30%'
                        },
                        xAxis: {
                            type: 'value',
                            scale: true,
                            position: 'top',
                            boundaryGap: false,
                            splitLine: {show: false},
                            axisLine: {show: false},
                            axisTick: {show: false},
                            axisLabel: {margin: 2, textStyle: {color: '#aaa'}},
                        },
                        yAxis: {
                            type: 'category',
                            name: 'TOP 20',
                            nameGap: 16,
                            axisLine: {show: false, lineStyle: {color: '#ddd'}},
                            axisTick: {show: false, lineStyle: {color: '#ddd'}},
                            axisLabel: {interval: 0, textStyle: {color: '#ddd'}},
                            data: []
                        },
                        series : [
                            {
                                name: 'pm2.5',
                                type: 'scatter',
                                coordinateSystem: 'geo',
                                data: convertedData[0],
                                symbolSize: function (val) {
                                    return Math.max(val[2] / 1000, 8);
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
                                data: convertedData[1],
                                symbolSize: function (val) {
                                    return Math.max(val[2] / 1000, 8);
                                },
                                showEffectOn: 'emphasis',
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
                            },
                            {
                                id: 'bar',
                                zlevel: 2,
                                type: 'bar',
                                symbol: 'none',
                                itemStyle: {
                                    normal: {
                                        color: '#ddb926'
                                    }
                                },
                                data: []
                            }
                        ]
                    };


                    myChart06.on('brushselected', renderBrushed);

                     myChart06.setOption(option);

                    setTimeout(function () {
                        myChart06.dispatchAction({
                            type: 'brush',
                            areas: [
                                {
                                    geoIndex: 0,
                                    brushType: 'polygon',
                                    coordRange: [[119.72,34.85],[119.68,34.85],[119.5,34.84],[119.19,34.77],[118.76,34.63],[118.6,34.6],[118.46,34.6],[118.33,34.57],[118.05,34.56],[117.6,34.56],[117.41,34.56],[117.25,34.56],[117.11,34.56],[117.02,34.56],[117,34.56],[116.94,34.56],[116.94,34.55],[116.9,34.5],[116.88,34.44],[116.88,34.37],[116.88,34.33],[116.88,34.24],[116.92,34.15],[116.98,34.09],[117.05,34.06],[117.19,33.96],[117.29,33.9],[117.43,33.8],[117.49,33.75],[117.54,33.68],[117.6,33.65],[117.62,33.61],[117.64,33.59],[117.68,33.58],[117.7,33.52],[117.74,33.5],[117.74,33.46],[117.8,33.44],[117.82,33.41],[117.86,33.37],[117.9,33.3],[117.9,33.28],[117.9,33.27],[118.09,32.97],[118.21,32.7],[118.29,32.56],[118.31,32.5],[118.35,32.46],[118.35,32.42],[118.35,32.36],[118.35,32.34],[118.37,32.24],[118.37,32.14],[118.37,32.09],[118.44,32.05],[118.46,32.01],[118.54,31.98],[118.6,31.93],[118.68,31.86],[118.72,31.8],[118.74,31.78],[118.76,31.74],[118.78,31.7],[118.82,31.64],[118.82,31.62],[118.86,31.58],[118.86,31.55],[118.88,31.54],[118.88,31.52],[118.9,31.51],[118.91,31.48],[118.93,31.43],[118.95,31.4],[118.97,31.39],[118.97,31.37],[118.97,31.34],[118.97,31.27],[118.97,31.21],[118.97,31.17],[118.97,31.12],[118.97,31.02],[118.97,30.93],[118.97,30.87],[118.97,30.85],[118.95,30.8],[118.95,30.77],[118.95,30.76],[118.93,30.7],[118.91,30.63],[118.91,30.61],[118.91,30.6],[118.9,30.6],[118.88,30.54],[118.88,30.51],[118.86,30.51],[118.86,30.46],[118.72,30.18],[118.68,30.1],[118.66,30.07],[118.62,29.91],[118.56,29.73],[118.52,29.63],[118.48,29.51],[118.44,29.42],[118.44,29.32],[118.43,29.19],[118.43,29.14],[118.43,29.08],[118.44,29.05],[118.46,29.05],[118.6,28.95],[118.64,28.94],[119.07,28.51],[119.25,28.41],[119.36,28.28],[119.46,28.19],[119.54,28.13],[119.66,28.03],[119.78,28],[119.87,27.94],[120.03,27.86],[120.17,27.79],[120.23,27.76],[120.3,27.72],[120.42,27.66],[120.52,27.64],[120.58,27.63],[120.64,27.63],[120.77,27.63],[120.89,27.61],[120.97,27.6],[121.07,27.59],[121.15,27.59],[121.28,27.59],[121.38,27.61],[121.56,27.73],[121.73,27.89],[122.03,28.2],[122.3,28.5],[122.46,28.72],[122.5,28.77],[122.54,28.82],[122.56,28.82],[122.58,28.85],[122.6,28.86],[122.61,28.91],[122.71,29.02],[122.73,29.08],[122.93,29.44],[122.99,29.54],[123.03,29.66],[123.05,29.73],[123.16,29.92],[123.24,30.02],[123.28,30.13],[123.32,30.29],[123.36,30.36],[123.36,30.55],[123.36,30.74],[123.36,31.05],[123.36,31.14],[123.36,31.26],[123.38,31.42],[123.46,31.74],[123.48,31.83],[123.48,31.95],[123.46,32.09],[123.34,32.25],[123.22,32.39],[123.12,32.46],[123.07,32.48],[123.05,32.49],[122.97,32.53],[122.91,32.59],[122.83,32.81],[122.77,32.87],[122.71,32.9],[122.56,32.97],[122.38,33.05],[122.3,33.12],[122.26,33.15],[122.22,33.21],[122.22,33.3],[122.22,33.39],[122.18,33.44],[122.07,33.56],[121.99,33.69],[121.89,33.78],[121.69,34.02],[121.66,34.05],[121.64,34.08]]
                                }
                            ]
                        });
                    }, 0);


                    function renderBrushed(params) {
                        var mainSeries = params.batch[0].selected[0];

                        var selectedItems = [];
                        var categoryData = [];
                        var barData = [];
                        var maxBar = 30;
                        var sum = 0;
                        var count = 0;

                        for (var i = 0; i < mainSeries.dataIndex.length; i++) {
                            var rawIndex = mainSeries.dataIndex[i];
                            var dataItem = convertedData[0][rawIndex];
                            var pmValue = dataItem.value[2];

                            sum += pmValue;
                            count++;

                            selectedItems.push(dataItem);
                        }

                        selectedItems.sort(function (a, b) {
                            return a.value[2] - b.value[2];
                        });

                        for (var i = 0; i < Math.min(selectedItems.length, maxBar); i++) {
                            categoryData.push(selectedItems[i].name);
                            barData.push(selectedItems[i].value[2]);
                        }

                        this.setOption({
                            yAxis: {
                                data: categoryData
                            },
                            xAxis: {
                                axisLabel: {show: !!count}
                            },
                            title: {
                                id: 'statistic',
                                text: count ? '平均: ' + (sum / count).toFixed(4) : ''
                            },
                            series: {
                                id: 'bar',
                                data: barData
                            }
                        });
                    }
        	    },  
        	     error : function() {  
        	          alert("xndb数据库异常！");  
        	     }  
        		});
	</script>
	<script type="text/javascript">
	function myChart07(){
	    var myChart07 = echarts.init(document.getElementById('tomonth_product_money'),'roma');
	    option = {
	        title: {
	            text: '今月小牛普惠各产品总销售量',
	            subtext: 'Data From Xndb Database',
	            left: 'left'
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: "{a} <br/>{b}: {c} ({d}%)"
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
	            }
	        ]
	    };
	    myChart07.showLoading();
	
	    $.ajax( {
	        url:'GetJson/GJ_tomonth_product_money.jsp',
	        type:'post',
	        cache:false,
	        dataType:'json',
	        success:function(result) {
	            myChart07.hideLoading();
	            myChart07.setOption(
	                    {
	                        series: [
	                            {data:result.S_data1},
	                            {data:result.S_data0}
	                        ]
	                    });
	        },
	        error : function() {
	            alert("本页面数据未加载...！");
	        }
	    });
	    myChart07.setOption(option);}
	</script>
	<script type="text/javascript">
	function myChart08(){
	    var myChart08 = echarts.init(document.getElementById('product_money'),'roma');
	    option = {
	        title: {
	            text: '小牛普惠各产品总销售量',
	            subtext: 'Data From Xndb Database',
	            left: 'left'
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: "{a} <br/>{b}: {c} ({d}%)"
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
	            }
	        ]
	    };
	    myChart08.showLoading();
	
	    $.ajax( {
	        url:'GetJson/GJ_product_name.jsp',
	        type:'post',
	        cache:false,
	        dataType:'json',
	        success:function(result) {
	            myChart08.hideLoading();
	            myChart08.setOption(
	                    {
	                        series: [
	                            {data:result.S_data1},
	                            {data:result.S_data0},
	                        ]
	                    });
	        },
	        error : function() {
	            alert("本页面数据未加载...！");
	        }
	    });
	    myChart08.setOption(option);}
	</script>
	    
<script type="text/javascript">
      
    function getCookie(sName)
    {
    var aCookie = document.cookie.split("; ");
    for (var i=0; i < aCookie.length; i++)
    {
    var aCrumb = aCookie[i].split("=");
    if (sName == aCrumb[0])
    return unescape(aCrumb[1]);
    }
    return null;
    }

          var user = getCookie('Username');
          var password = getCookie('Password');
          var para={"username":user,"password":password,"login":"登录"};
          $.post("login_helper.jsp",para,function(msg,status){
            console.log(msg.res);
            if(msg.res == 'success'){
            	alert('登录成功！！'+user+'!');
            	myChart01();
            	myChart02();myChart03();myChart04();myChart07();myChart08();
            }/*登录成功跳转到主界面*/
            else{
            	location.href="./login.jsp";
            }
          });      
    </script>	
</html>