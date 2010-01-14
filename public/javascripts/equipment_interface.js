var viewport;

var equipmentInterface = function(){
    var viewport;
    return {
        init:function(){
            viewport = new Ext.Viewport({
                title: 'Equipment',
                waitMsgTarget: true,
                loadMask: true,
                layout: 'border',
				defaults: {
				    collapsible: true,
				    split: true,
		            cmargins: '0 5 5 5'		
				},
                items: [new Ext.BoxComponent({
		            region: 'north',
		            split: false,
		            height: 30,
		            el: 'header'
		        }),
				{
				    title: 'Log',
				    region:'west',
					layout:'vbox',
				    width: 200,
		            margins: '0 0 5 5',
				    minSize: 150,
				    maxSize: 250,
					layoutConfig: {
					    align : 'stretch',
					    pack  : 'start',
					},
					defaults: {
			            border: false
					},
					items: [
					    {html:'log list', flex:1},
					    {html:'log post', height:50}
					]
				},gmap,
		        {
				    title: 'Information',
				    region:'east',
		            margins: '0 5 5 0',		
				    width: 300,			
				    minSize: 200,
				    maxSize: 400}]
            });
        }
    }
}();
