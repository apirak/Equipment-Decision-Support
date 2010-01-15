var map_tb = new Ext.Toolbar();

var add_flag = new Ext.Action( {
	text : 'Add Dissaster',
	handler : function() {
		Ext.Msg.alert('Its fine', 'and its art.');
	},
	iconCls : 'flag_plus',
	tooltip : '<b>Quick Tips</b><br/>Icon only button with tooltip'
});

map_tb.add('Equipment Map', '-', add_flag, '-');

var gmap = {
	id : 'my_map',
	region : 'center',
	collapsible : false,
	xtype : 'gmappanel',
	margins : '0 0 5 0',
	gmapType : 'map',
	tbar : map_tb,
	border : true,
	zoomLevel : 10,
    mapConfOpts: ['enableScrollWheelZoom','enableDoubleClickZoom','enableDragging'],
    mapControls: [new GSmallMapControl(),'GMapTypeControl','NonExistantControl'],
	setCenter : {
		geoCodeAddr : 'พุทธมณฑล, Phutthamonthon Sai 4, Salaya, Phutthamonthon, Nakhon Pathom 73170, 73170, Thailand',
		marker : {
			title : 'Fenway Park'
		}
	},
	markers : [ {
		lat : 13.794848,
		lng : 100.339494,
		marker : {
			title : 'Boston Museum of Fine Arts'
		},
		listeners : {
			click : function(e) {
				Ext.Msg.alert('Its fine', 'and its art.');
			}
		}
	}, {
		lat : 13.800432,
		lng : 100.333228,
		marker : {
			title : 'Northeastern University'
		}
	} ]

};
