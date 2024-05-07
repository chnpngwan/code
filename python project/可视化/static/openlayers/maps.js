 // 创建地图
    var map = new ol.Map({
      target: 'map',
      layers: [
        // 使用卫星图层
        new ol.layer.Tile({
          source: new ol.source.XYZ({
            url: 'http://map.geoq.cn/arcgis/rest/services/ChinaOnlineStreetPurplishBlue/MapServer/tile/{z}/{y}/{x}'
            //url :'http://t{0-7}.tianditu.gov.cn/img_c/wmts?T=cva_w&x={x}&y={y}&l={z}&tk=8c3b91d7df1182d1ea4ece363ff4c863'
          })
        })
      ],
      view: new ol.View({
        // 设置初始中心点和缩放级别
        center: ol.proj.fromLonLat([102.85271034362256,24.628392370463928]),
        zoom: 15
      })
    });

    // 创建一个矩形要素
    var rectangleFeature = new ol.Feature({
      geometry: new ol.geom.Polygon([
        [
            [11449025.891582364,2829369.3891470605],
            [11448950.582905062,2830313.289428982],
            [11449558.845298659,2830446.477812321],
            [11450126.556866016,2830000.5862681],
            [11449773.185380213,2829635.765913738]
        ]
      ])
    });

    // 创建一个矢量图层并将矩形要素添加到其中
    var vectorLayer = new ol.layer.Vector({
      source: new ol.source.Vector({
        features: [rectangleFeature]
      })
    });
    map.addLayer(vectorLayer);


    //添加一个气泡框
 // 添加气泡框
    var popup = new ol.Overlay({
      element: document.getElementById('popup'),
      positioning: 'right-center',
      stopEvent: false
    });
    map.addOverlay(popup);

    // 设置气泡框内容
    var tname = document.getElementById('tname');
    var type = document.getElementById('type');
    var much = document.getElementById('much');
    var waring = document.getElementById('waring');
    var image = document.getElementById('image');
    tname.textContent = '玉溪福鑫源蔬菜种植基地';
    type.textContent = '蔬菜类';
    much.textContent = '121.8';
    waring.textContent = '1558';
    image.src = 'static/imgs/tp.png'; // 请替换为实际图片路径

    // 显示气泡框
    popup.setPosition(ol.proj.fromLonLat([102.85271034362256, 24.628392370463928]));

    // 地图点击事件
    map.on("click",function(event){
        var coordinate = event.coordinate;
      var lonLatCoordinate = ol.proj.transform(coordinate, 'EPSG:3857', 'EPSG:4326');
      console.log('点击坐标 (EPSG:3857): ' + coordinate);
      console.log('经纬度坐标 (EPSG:4326): ' + lonLatCoordinate);
    })