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
	mapConfOpts : [ 'enableScrollWheelZoom', 'enableDoubleClickZoom',
			'enableDragging' ],
	mapControls : [ 'GSmallMapControl', 'GMapTypeControl' ],
	setCenter : {
		lat : 13.799101,
		lng : 100.367914,
		marker : {
			title : 'ศาลาธรรมสพน์'
		}
	},
	markers : [ {
		lat : 42.339641,
		lng : -71.094224,
		marker : {
			title : 'Boston Museum of Fine Arts'
		}
	}, {
		lat : 42.339419,
		lng : -71.09077,
		marker : {
			title : 'Northeastern University'
		}
	} ]
};
