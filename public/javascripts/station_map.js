var cone_image = "/images/fugue/icons/traffic-cone.png"
var cone_arrow_image = "/images/fugue/icons/_overlay/traffic-cone--arrow.png"

var switchToTable = new Ext.Action( {
    iconCls : 'table_view',
    text : 'Table view',
    handler : function() {
        stationPanel.layout.setActiveItem('station_table');
    },
    tooltip : '<b>Switch view</b><br/>switch to table view'
});

var add_flag = new Ext.Action( {
    text : 'Add Dissaster',
    handler : function() {
        Ext.getCmp('station_map').getMap().setCenter(new google.maps.LatLng(37.4419, -122.1419, false), 13);
    //Ext.Msg.alert('Its fine', 'and its art.');
    },
    iconCls : 'flag_plus',
    tooltip : '<b>Quick Tips</b><br/>Icon only button with tooltip'
});

var show_station = new Ext.Action( {
    text : 'Show all station',
    handler : function() {
        loadingCurrentStation();
    },
    iconCls : 'flag_plus',
    tooltip : '<b>Quick Tips</b><br/>Icon only button with tooltip'
});

var add_station = new Ext.Action( {
    text : 'Add Station',
    handler : function() {
        map = Ext.getCmp('station_map').getMap()
        
        var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
        '<div id="bodyContent">'+
        '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
        'sandstone rock formation in the southern part of the '+
        'Northern Territory, central Australia. It lies 335 km (208 mi) '+
        'south west of the nearest large town, Alice Springs; 450 km '+
        '(280 mi) by road. Kata Tjuta and Uluru are the two major '+
        'features of the Uluru - Kata Tjuta National Park. Uluru is '+
        'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
        'Aboriginal people of the area. It has many springs, waterholes, '+
        'rock caves and ancient paintings. Uluru is listed as a World '+
        'Heritage Site.</p>'+
        '<p>Attribution: Uluru, <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
        'http://en.wikipedia.org/w/index.php?title=Uluru</a> (last visited June 22, 2009).</p>'+
        '</div>'+
        '</div>';

        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });

        var myLatlng = new google.maps.LatLng(13.782903,100.35264);
		
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title:"Hello World!",
            icon:cone_image
        });

        marker.setDraggable(true);
		
        google.maps.event.addListener(marker, 'click', function() {
            console.log(this)
            this.setIcon(cone_arrow_image)
        });
		
        /*
		google.maps.event.addListener(marker, 'click', function() {
		  infowindow.open(map,marker);
		});		
		*
		/*
		google.maps.event.addListener(marker, 'click', function() {
		    Ext.Msg.alert('Its fine', 'and its art.');
		  });
		*/
        map.setCenter(myLatlng);
    },
    iconCls : 'flag_plus'
});


var show_geocode = new Ext.Action( {
    text : 'Curent Lat,Lng',
    handler : function() {
        map = Ext.getCmp('station_map').getMap();
        lat = map.getCenter().lat();
        lng = map.getCenter().lng();
        Ext.Msg.alert('Center Position', "Lat:" +lat + " Lng:" + lng);
    },
    iconCls : 'flag_plus'
});

var map_tb = new Ext.Toolbar();
map_tb.add('Station', '-', add_flag, '-', {
    text: 'Action Menu',
    menu: [add_station, show_geocode, show_station]
},
'->', switchToTable);

var stationMap = {}
if (online) {
    stationMap = {
        id : 'station_map',
        xtype : 'gmappanel',
        gmapType : 'map',
        tbar : map_tb,
        zoomLevel : 10,
        mapConfOpts: ['enableScrollWheelZoom','enableDoubleClickZoom','enableDragging'],
        mapControls: ['GSmallMapControl','GMapTypeControl'],
        setCenter: {
            lat : 13.794848,
            lng : 100.339494
        },
        markers : [ ]
    };
}

var addMarker = function(title, lat, lng){
    map = Ext.getCmp('station_map').getMap();

    var myLatlng = new google.maps.LatLng(lat, lng);

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: title,
        icon:cone_image
    });

    infowindow = new google.maps.InfoWindow({
        content: "<h1>Bank</h1>"
    });

    google.maps.event.addListener(marker, 'click', function() {
        //console.log(this);
        //console.log(marker);
        this.setIcon(cone_arrow_image);
        this.setDraggable(true);
        infowindow.open(map, marker);
    });

    google.maps.event.addListener(marker, 'mouseover', function() {
        //infowindow.open(map, marker);
        var infoBox = new InfoBox({latlng: marker.getPosition(),
            map: map,
            content: "สถานีบางรัก"});
    });
    
    map.setCenter(myLatlng);
};

var loadingCurrentStation = function(){
    positions = positionDataStore.data.items;
    count = 0;
    for(count =0; count < positions.length; count++) {
        position = positions[count].data;
        //console.log('Center Position', "Lat:" +position.lat + " Lng:" + position.lng);
        addMarker(position.description, position.lat,position.lng)
    }
};