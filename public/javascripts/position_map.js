var cone_image = "/images/fugue/icons/traffic-cone.png"
var cone_arrow_image = "/images/fugue/icons/_overlay/traffic-cone--arrow.png"

var site_icon = "/images/sit_disaster.png";
var department_icon = "/images/department.png";

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
	      map = Ext.getCmp('position_map').getMap();
        lat = map.getCenter().lat();
        lng = map.getCenter().lng();

				url = '/site.xml'
				tab_site.setActiveTab(0);
			  fs.getForm().load({url:url, 
				  params: {
						lat: lat,
						lng: lng
				  },
				  waitMsg:'Loading', 
				  method:'post',
					success: function(form, action) {
		        current_site_id = fs.getForm().getValues()['id'];
		        map.setCenter(new google.maps.LatLng(lat, lng, false), 13);
		 				addMarker({id:current_site_id , type: "Site" , description: "description"}, 
							"New site", lat, lng, "Site");
					}
				});
    },
    iconCls : 'add_site',
    tooltip : '<b>Quick Tips</b><br/>Icon only button with tooltip'
});

var toggle_department = new Ext.Action({
    text: 'Department',
    iconCls : 'department',
    enableToggle: true,
    toggleHandler: function(button, pressed){
        if (department_markers.length == 0) {
            loadPosition('Department');
        } else {
            if (pressed) {
                setVisiblePositions(department_markers, true);     
            } else {
                setVisiblePositions(department_markers, false);
            }
        }
				return true;
    },
		handler: function(){
			
		}
});

var toggle_site = new Ext.Action({
    text: 'Site',
    iconCls : 'site',
    enableToggle: true,
    handler: function(){
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

var load_traffic = new Ext.Action( {
    text : 'Load traffic',
    handler : function() {
        map = Ext.getCmp('position_map').getMap();
        trafficLayer = new google.maps.TrafficLayer();
        trafficLayer.setMap(map);
    },
    iconCls : 'chart_line'
});

var map_tb = new Ext.Toolbar();
map_tb.add(toggle_department,
    toggle_site, '-',
    add_site, '-', {
				text: 'Department by Equipment',
				menu: equipment_names
    }, '->', load_traffic, switchToTable);

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
    var draggable = true
    var icon = site_icon;
    var markers = site_markers;
    if (type == 'Department') {
        markers = department_markers;
        icon = "/images/" + position.icon + ".png";
				draggable = false
    }

    totalMarker = markers.length;
    markers[totalMarker] = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: title,
        icon: icon,
				draggable: draggable,
				position_id: position.id
    });
		info = "<div class='info'>"+ position.name + "</div>"
    var infowindow = new google.maps.InfoWindow({
        content: info
    });
		
    google.maps.event.addListener(markers[totalMarker], 'click', function() {
        //this.setDraggable(true);
				url = '/site/'+position.id+'.xml'
				current_site_id = position.id;
				if (position.type == "Site"){
					tab_site.setActiveTab(0);
				  fs.getForm().load({url:url, waitMsg:'Loading', method:'get'});
			  } else {
				  infowindow.open(map, this);
			  }
    });
		/*
    google.maps.event.addListener(markers[totalMarker], 'dragstart', function() {
  			url = '/site/'+this.position_id+'.xml'
	  		current_site_id = this.position_id;
			  if (position.type == "Site"){
					tab_site.setActiveTab(0);
				  fs.getForm().load({url:url, waitMsg:'Loading', method:'get'});
			  }
    });
		*/
    google.maps.event.addListener(markers[totalMarker], 'dragend', function() {
				url = '/site/site_position/'+this.position_id+'.xml'
	  		current_site_id = this.position_id;
			  if (position.type == "Site"){
					tab_site.setActiveTab(0);
				  fs.getForm().load({url:url, waitMsg:'Loading', 
				    method:'put', 
				    params: {
						lat: this.getPosition().lat(),
						lng: this.getPosition().lng()
				  }});
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
        addMarker(position, position.description, position.lat, position.lng)
    }
};

// position is array of marker
// visible is boolean
var setVisiblePositions = function(positions, visible){
    for(count=0; count < positions.length; count++) {
        positions[count].setVisible(visible);
    }
}


var loadAllPosition = function(){
	loadPosition("Site");
	loadPosition("Department");
	setVisiblePositions(department_markers, false);
	setVisiblePositions(site_markers, false);
}
// load position to map by type of position
// type is Department and Site
var loadPosition = function(type){
    positions = positionDataStore.query('type',type).items;
    var count = 0;
    for(count =0; count < positions.length; count++) {
        var position = positions[count].data;
				console.log
        addMarker(position, position.description, position.lat,position.lng, type)
    }
}

var showOnlyDepartmentById = function(ids){
	for(count=0; count < department_markers.length; count++){
			if (numberInArray(department_markers[count].position_id, ids)){
				department_markers[count].setVisible(true);
			} else {
				department_markers[count].setVisible(false);
			}
  }
}

var numberInArray = function(number, array){
	for(i=0; i < array.length; i++){
		if (array[i] == number) {
			return true;
		}
	}
	return false;
}