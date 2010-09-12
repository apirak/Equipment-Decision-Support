var switchToMap = new Ext.Action( {
    iconCls : 'map_view',
    text : 'Map view',
    handler : function() {
        positionPanel.layout.setActiveItem('position_map');
        map = Ext.getCmp('position_map').getMap();

        // Force refresh
        lat = 13.744829667909531 //map.getCenter().lat();
        lng = 100.52900816015627 //map.getCenter().lng()
        zoom = map.getZoom();
        current_position = new google.maps.LatLng(lat, lng, false);
        Ext.getCmp('position_map').getMap().setCenter(current_position, zoom);

				//loadingCurrentPosition();

        trafficLayer = new google.maps.TrafficLayer();
        trafficLayer.setMap(map);
    },
    tooltip : 'switch to map view'
});

var table_tb = new Ext.Toolbar();
table_tb.add('All Positions', '->', switchToMap);

var paginateToolsBar = new Ext.PagingToolbar({
    id:'paginate_tools_bar',
    border: true,
    store: positionDataStore,
    pageSize: pageSize,
    displayInfo: true,
    displayMsg: 'Position {0} - {1} of {2}',
    emptyMsg: "No position by your search condition"
})

tableViewSelectedListeners = {
    selectionchange: function(selModel){
        if(selModel.getCount() != 0) {
            if(selModel.getCount() == 1){
							position_id = selModel.getSelected().data.id
							position_type = selModel.getSelected().data.type
							url = '/site/'+position_id+'.xml'
							current_site_id = position_id;
							if (position_type == "Site"){
								tab_site.setActiveTab(0);
							  fs.getForm().load({url:url, waitMsg:'Loading', method:'get'});
						  }
            } else {
                // media_selects(selModel.selections.items);
                //alert("positions")
            }
        } else {
            // media_select_not_thing();
            //alert("select notthing")
        }
    }
}

var positionTable = new Ext.grid.GridPanel({
    id: 'position_table',
    store: positionDataStore,
    columns: positionColumnField,
		viewConfig: {
		  forceFit:true
    },
    margins: '0 5 5 0',
    padding: '0 0 0 0',
    tbar: table_tb,
    bbar: paginateToolsBar,
    loadMask:{
        msg: 'Loading Data...',
        enabled: true
    },
    selModel: new Ext.grid.RowSelectionModel({
        singleSelect:true,
        listeners: tableViewSelectedListeners
    })
});
