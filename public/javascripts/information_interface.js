var myData = [
['Equipment A','department A','suggest'],
['Equipment B','department C','suggest'],
['Equipment C','department X','suggest']
];

/**
     * Custom function used for column renderer
     * @param {Object} val
     */
	Ext.namespace('Ext.site');
		Ext.site.dissaster = [
				[1, 'Fire', 'อัคคีภัย'],
				[2, 'Flood', 'อุทกภัย'],
				[3, 'Strom', 'วาตภัย'],
				[4, 'Earthquake','ภัยจากแผ่นดินไหวและอาคารถล่ม'],
				[5,'Drought','ภัยแล้ง',],
				[6,'Chemical hazard','ภัยจากสารเคมีและวัตถุอันตราย',],
				[7,'Transportation hazard','ภัยจากการคมนาคมและขนส่ง',],
				[8,'Epidemic','ภัยจากโรคระบาดสัตว์และพืช',],
				[9,'Terrorist','ภัยจากการก่อวินาศกรรม',],
				[10,'Riot','ภัยจากการชุมนุมประท้วงและก่อการจราจล',]
			];	
     
		Ext.site.weight_limit = [
        [1, 'more_20', 'งานยกน้ำหนักมากกว่า 20 ตัน'],
        [2, 'limit_20', 'งานยกน้ำหนักไม่เกิน 20 ตัน'],
        [3, 'limit_5', 'งานยกน้ำหนักไม่เกิน 5 ตัน']
    ];

		Ext.site.ground_strength = [
				[1, 'hard', 'พื้นผิวมีความแข็งแรง'],
				[2, 'soft', 'พื้นผิวอ่อนนุ่มสามารถทำงานได้'],
				[3, 'very soft', 'พื้นผิวอ่อนนุ่มมากควรใช้เครื่องจักรตีนตะขาบ']
		];
		
		Ext.site.equipment_size = [
		    [1, 'small', 'ขับแคบต้องใช้เครื่องจักรขนาดเล็ก'],
		    [2, 'medium', 'กว้างพอต่อเครื่องจักรขนาดกลาง'],
		    [3, 'large', 'กว้างขวางทำงานได้สะดวก']
		]
/**
     * Custom function used for column renderer
     * @param {Object} val
     */

// A reusable error reader class for XML forms
Ext.form.XmlErrorReader = function(){
    Ext.form.XmlErrorReader.superclass.constructor.call(this, {
            record : 'field',
            success: '@success'
        }, [
            'id', 'msg'
        ]
    );
};
Ext.extend(Ext.form.XmlErrorReader, Ext.data.XmlReader);
		



/********************/
/* FORM             */
/********************/

Ext.QuickTips.init();

 // turn on validation errors beside the field globally
 Ext.form.Field.prototype.msgTarget = 'side';

 var fs = new Ext.FormPanel({
     frame: true,
		 bodyBorder: false,
		 border: false,
		 border: false,
     title:'General',
     labelAlign: 'right',
     labelWidth: 80,
		 autoScroll: true,		
     //width:350,
     waitMsgTarget: true,

     // configure how to read the XML Data
     reader : new Ext.data.XmlReader({
         record : 'site',
         success: '@success'
     }, [
         'id','title', 'name', 'description', 'type', 'lat', 'lng', 
				 'remark', 'location',
				 'size_id', 'ground_strength_id', 
				 'weight_limit_id', 'dissaster_id',
			   {name: 'electric', type:'boolean'},
			   {name: 'light', type:'boolean'},
			   {name: 'demolish', type:'boolean'},
			   {name: 'move_mat', type:'boolean'},
			   {name: 'repair_route', type:'boolean'},
			   {name: 'site_clear', type:'boolean'},
			   {name: 'rain', type:'boolean'},
			   {name: 'night_time', type:'boolean'},
			   {name: 'wind_hard', type:'boolean'},
			   {name: 'power_source', type:'boolean'},						
     ]),

     // reusable eror reader class defined at the end of this file
     errorReader: new Ext.form.XmlErrorReader(),
     defaultType: 'textfield',
		 defaults:{
				width:180,
				enableColors: false,
	      enableAlignments: false,
				enableFont: false,
				enableLinks: false,
				enableFontSize: false,
				enableSourceEdit: false
		 },
     items: [{
					xtype: 'hidden',
          name: 'id'
      },{
          fieldLabel: 'Title', 
					emptyText: 'First Name',
          name: 'title'
      }, {
          fieldLabel: 'Name',
          emptyText: 'Name',
          name: 'name'
      }, {
					xtype:'htmleditor',
          fieldLabel: 'Description',
					emptyText: 'Description',
          name: 'description',
	height: 80
      },	{
          fieldLabel: 'Lat',
          emptyText: 'Ex. 123.1222343243',
          name: 'lat'
      }, {
          fieldLabel: 'Lng',
          emptyText: 'Ex. 123.1222343243',
          name: 'lng'
      },{
					xtype:'htmleditor',
          fieldLabel: 'Location',
					emptyText: 'Location',
          name: 'location',
          height: 80,
          
      }, new Ext.form.ComboBox({
	        fieldLabel: 'Disaster',
	        hiddenName:'dissaster_id',
	        store: new Ext.data.ArrayStore({
	            fields: ['id', 'name', 'description'],
	            data : Ext.site.dissaster
	        }),
	        valueField:'id',
	        displayField:'description',
	        typeAhead: true,
	        mode: 'local',
	        triggerAction: 'all',
	        emptyText:'Select type of disaster',
	        selectOnFocus:true,
			}),
      new Ext.form.ComboBox({
	        fieldLabel: 'Devastated area',
	        hiddenName:'size_id',
	        store: new Ext.data.ArrayStore({
	            fields: ['id', 'name', 'description'],
	            data : Ext.site.equipment_size
	        }),
	        valueField:'id',
	        displayField:'description',
	        typeAhead: true,
	        mode: 'local',
	        height: 150,
	        triggerAction: 'all',
	        emptyText:'Select size of devastated aread',
	        selectOnFocus:true,
			}), new Ext.form.ComboBox({
	        fieldLabel: 'Ground strength',
	        hiddenName:'ground_strength_id',
	        store: new Ext.data.ArrayStore({
	            fields: ['id', 'name', 'description'],
	            data : Ext.site.ground_strength
	        }),
	        valueField:'id',
	        displayField:'description',
	        typeAhead: true,
	        mode: 'local',
	        triggerAction: 'all',
	        emptyText:'Select ground strength',
	        selectOnFocus:true,
			}), new Ext.form.ComboBox({
	        fieldLabel: 'Weightlifting',
	        hiddenName:'weight_limit_id',
	        store: new Ext.data.ArrayStore({
	            fields: ['id', 'name', 'description'],
	            data : Ext.site.weight_limit
	        }),
	        valueField:'id',
	        displayField:'description',
	        typeAhead: true,
	        mode: 'local',
	        triggerAction: 'all',
	        emptyText:'Select weightlifting work',
	        selectOnFocus:true,
			}),  {
					xtype:'checkbox',
          fieldLabel: 'Electrical',
          name: 'electric'
      }, {
					xtype:'checkbox',
          fieldLabel: 'Need Light',
          name: 'light'
      }, {
					xtype:'checkbox',
          fieldLabel: 'Demolish',
          name: 'demolish'
      }, {
					xtype:'checkbox',
          fieldLabel: 'Move material',
          name: 'move_mat'
      },{
					xtype:'checkbox',
          fieldLabel: 'Site Clearing',
          name: 'site_clear'
      }, {
					xtype:'checkbox',
          fieldLabel: 'Repair route',
          name: 'repair_route'
      },{
			xtype:'checkbox',
        fieldLabel: 'Raining now',
        name: 'rain'
      }, {
					xtype:'checkbox',
          fieldLabel: 'Night time',
          name: 'night_time'
      }, {
					xtype:'checkbox',
          fieldLabel: 'Wind hard',
          name: 'wind_hard'
      }, {
				xtype:'checkbox',
         fieldLabel: 'Fruel',
         name: 'power_source'
      },{
					xtype:'htmleditor',
          fieldLabel: 'Remark',
					emptyText: 'Remark',
          name: 'remark',
          height: 120
      }
/*
, new Ext.form.ComboBox({
          fieldLabel: 'State',
          hiddenName:'state',
          store: new Ext.data.ArrayStore({
              fields: ['abbr', 'state'],
              data : Ext.exampledata.states // from states.js
          }),
          valueField:'abbr',
          displayField:'state',
          typeAhead: true,
          mode: 'local',
          triggerAction: 'all',
          emptyText:'Select a state...',
          selectOnFocus:true,
          width:190
      }),

      new Ext.form.DateField({
          fieldLabel: 'Date of Birth',
          name: 'dob',
          width:190,
          allowBlank:false
      } ) */
     ]
 });

 // simple button add
 fs.addButton('Load', function(){
     fs.getForm().load({url:'/site/6.xml', waitMsg:'Loading', method:'get'});
 });

 // explicit add
 var submit = fs.addButton({
     text: 'Submit',
     disabled:true,
     handler: function(){
				 url = '/site/' + current_site_id + '.xml'
         fs.getForm().submit({
						method:'put',
						url:url, 
						waitMsg:'Saving Data...'});
     }
 });

fs.on({
    actioncomplete: function(form, action){
        if(action.type == 'load'){
            submit.enable();
        }
    }
});

// End Form


// Equipment

var grid = {
		id:"element_tab",
		title:"equipment",
		listeners: {activate: function(){
			url = 'site/equipment/' + current_site_id
			this.load({
			    url: url,
			    //params: {param1: 'foo', param2: 'bar'}, // or a URL encoded string
			    //callback: yourFunction,
			    //scope: yourObject, // optional scope for the callback
			    discardUrl: false,
			    nocache: false,
			    text: 'Loading...',
			    timeout: 30,
			    scripts: false
			});
		}},
		//autoLoad: { url: 'site/equipment/6' , params: 'foo=bar'},
		autoScroll: true,
		el:'equipment_tab',
		tbar:{
			items:[{
			  text:'suggestion',
				handler: function(){
					Ext.MessageBox.confirm('Generate Suggestion', 'Your current equipment will be remove. Do you want to continue?', function(btn){
						if (btn == 'yes') {
							element_tab = Ext.getCmp('element_tab');
							url = 'site/equipment/' + current_site_id;
							element_tab.load({
							    url: url,
							    params: {suggestion: true}, // or a URL encoded string
							    //callback: yourFunction,
							    //scope: yourObject, // optional scope for the callback
							    discardUrl: false,
							    nocache: false,
							    text: 'Loading...',
							    timeout: 30,
							    scripts: false
							});
						}
					});
				}
		  },{
			  text:'edit',
  			handler: function(){
					//Netzke.page.windowWithGridPanel.show();
					url = "equipment/show/" + current_site_id;
					window.open(url);
				}
		  },{
			  text:'send',
				handler: function(){
					message_text = Ext.getDom('site-equipment').innerHTML;
					message_text = "<div class='site-equipment'>"+message_text+"</div>";
					loglistHTML = Ext.getDom('log-list').innerHTML;
					loglistHTML = loglistHTML + messagePacking(message_text);
					Ext.getDom('log-list').innerHTML = loglistHTML;
					
					Ext.getCmp('messageLog').setValue("");
					console.log(Ext.getCmp('element_tab'));
				}
		}]
		}
}


var tab_site = new Ext.TabPanel({
    activeTab: 0,
    margins: {
        top:0,
        right:0,
        bottom:10,
        left:0
    },
    border:false,
    enableTabScroll:true,
		deferredRender:true,
    items:[fs,grid]
});

var information = {
    title: 'Site Information',
    region:'east',
    collapsible: true,
    margins: '0 5 5 0',
    layout: 'fit',
    width: 300,
    minSize: 200,
    maxSize: 600,
    layoutConfig: {
        align : 'stretch',
        pack  : 'start'
    },
    items:[tab_site]
};


