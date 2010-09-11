var cone_image = "/images/fugue/icons/traffic-cone.png"
var cone_arrow_image = "/images/fugue/icons/_overlay/traffic-cone--arrow.png"

var site_icon = "/images/icons/exclamation.png";
var department_icon = "/images/icons/lorry.png";

var department_markers = [];
var site_markers = [];

var switchToTable = new Ext.Action( {
    iconCls : 'table_view',
    text : 'Table view',
    handler : function() {
        positionPanel.layout.setActiveItem('position_table');
    },
    tooltip : '<b>Switch view</b><br/>switch to table view'
});

var add_site = new Ext.Action( {
    text : 'Add Site',
    handler : function() {
        lat = map.getCenter().lat();
        lng = map.getCenter().lng()
        map = Ext.getCmp('position_map').getMap()
        map.setCenter(new google.maps.LatLng(lat, lng, false), 13);
    },
    iconCls : 'add_site',
    tooltip : '<b>Quick Tips</b><br/>Icon only button with tooltip'
});

var toggle_department = new Ext.Action({
    text: 'Department',
    iconCls : 'department',
    enableToggle: true,
    handler: function(){
        //action.setDisabled(!action.isDisabled());
        if (department_markers.length == 0) {
            loadPosition('Department');
        } else {
            if (department_markers[0].getVisible()) {
                setVisiblePositions(department_markers, false);
            } else {
                setVisiblePositions(department_markers, true)
            }
        }
    }
});

var toggle_site = new Ext.Action({
    text: 'Site',
    iconCls : 'site',
    enableToggle: true,
    handler: function(){
        //action.setDisabled(!action.isDisabled());
        if (site_markers.length == 0) {
            loadPosition('Site');
        } else {
            if (site_markers[0].getVisible()) {
                setVisiblePositions(site_markers, false);
            } else {
                setVisiblePositions(site_markers, true)
            }
        }
    }
});

var show_position = new Ext.Action( {
    text : 'Show all position',
    handler : function() {
        loadingCurrentPosition();
    },
    iconCls : 'flag_plus',
    tooltip : '<b>Quick Tips</b><br/>Icon only button with tooltip'
});

var add_position = new Ext.Action( {
    text : 'Add Position',
    handler : function() {
        map = Ext.getCmp('position_map').getMap()
        
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
        map = Ext.getCmp('position_map').getMap();
        lat = map.getCenter().lat();
        lng = map.getCenter().lng();
        Ext.Msg.alert('Center Position', "Lat:" +lat + " Lng:" + lng);
    },
    iconCls : 'flag_plus'
});

var map_tb = new Ext.Toolbar();
map_tb.add(toggle_department,
    toggle_site, '-',
    add_site, '-',
    {
        text: 'Action Menu',
        menu: [add_position, show_geocode, show_position]
    },
    '->', switchToTable);

var positionMap = {}
if (online) {
    positionMap = {
        id : 'position_map',
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

var addMarker = function(position, title, lat, lng, type){
    map = Ext.getCmp('position_map').getMap();
    var myLatlng = new google.maps.LatLng(lat, lng);
    
    var icon = site_icon;
    var markers = site_markers;
    if (type == 'Department') {
        markers = department_markers;
        icon = department_icon;
    }

    totalMarker = markers.length;

    markers[totalMarker] = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: title,
        icon: icon
    });

    infowindow = new google.maps.InfoWindow({
        content: position.description
    });
		
    google.maps.event.addListener(markers[totalMarker], 'click', function() {
        //console.log(this);
        console.log(position);
        //this.setIcon(cone_arrow_image);
        this.setDraggable(true);
        infowindow.open(map, this);
				url = '/site/'+position.id+'.xml'
				current_site_id = position.id;
				if (position.type == "Site"){
				  fs.getForm().load({url:url, waitMsg:'Loading', method:'get'});
			  }
    });

    /*
    google.maps.event.addListener(marker, 'mouseover', function() {
        //infowindow.open(map, marker);
        var infoBox = new InfoBox({latlng: marker.getPosition(),
            map: map,
            content: "*252#1"});
    });
         */

    map.setCenter(myLatlng);
};

var loadingCurrentPosition = function(){
    positions = positionDataStore.data.items;
    count = 0;
    for(count =0; count < positions.length; count++) {
        position = positions[count].data;
        //console.log('Center Position', "Lat:" +position.lat + " Lng:" + position.lng);
        addMarker(position, position.description, position.lat,position.lng)
    }
};

// position is array of marker
// visible is boolean
var setVisiblePositions = function(positions, visible){
    for(count=0; count < positions.length; count++) {
        positions[count].setVisible(visible);
    }
}

// load position to map by type of position
// type is Department and Site
var loadPosition = function(type){
    positions = positionDataStore.query('type',type).items;
    var count = 0;
    for(count =0; count < positions.length; count++) {
        var position = positions[count].data;
				console.log(position);
        addMarker(position, position.description, position.lat,position.lng, type)
    }
}