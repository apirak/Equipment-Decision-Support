var myData = [
['Equipment A','department A','suggest'],
['Equipment B','department C','suggest'],
['Equipment C','department X','suggest']
];

/**
     * Custom function used for column renderer
     * @param {Object} val
     */

		Ext.namespace('Ext.exampledata');

		Ext.exampledata.states = [
		        ['AL', 'Alabama', 'The Heart of Dixie'],
		        ['AK', 'Alaska', 'The Land of the Midnight Sun'],
		        ['AZ', 'Arizona', 'The Grand Canyon State'],
		        ['AR', 'Arkansas', 'The Natural State'],
		        ['CA', 'California', 'The Golden State'],
		        ['CO', 'Colorado', 'The Mountain State'],
		        ['CT', 'Connecticut', 'The Constitution State'],
		        ['DE', 'Delaware', 'The First State'],
		        ['DC', 'District of Columbia', "The Nation's Capital"],
		        ['FL', 'Florida', 'The Sunshine State'],
		        ['GA', 'Georgia', 'The Peach State'],
		        ['HI', 'Hawaii', 'The Aloha State'],
		        ['ID', 'Idaho', 'Famous Potatoes'],
		        ['IL', 'Illinois', 'The Prairie State'],
		        ['IN', 'Indiana', 'The Hospitality State'],
		        ['IA', 'Iowa', 'The Corn State'],
		        ['KS', 'Kansas', 'The Sunflower State'],
		        ['KY', 'Kentucky', 'The Bluegrass State'],
		        ['LA', 'Louisiana', 'The Bayou State'],
		        ['ME', 'Maine', 'The Pine Tree State'],
		        ['MD', 'Maryland', 'Chesapeake State'],
		        ['MA', 'Massachusetts', 'The Spirit of America'],
		        ['MI', 'Michigan', 'Great Lakes State'],
		        ['MN', 'Minnesota', 'North Star State'],
		        ['MS', 'Mississippi', 'Magnolia State'],
		        ['MO', 'Missouri', 'Show Me State'],
		        ['MT', 'Montana', 'Big Sky Country'],
		        ['NE', 'Nebraska', 'Beef State'],
		        ['NV', 'Nevada', 'Silver State'],
		        ['NH', 'New Hampshire', 'Granite State'],
		        ['NJ', 'New Jersey', 'Garden State'],
		        ['NM', 'New Mexico', 'Land of Enchantment'],
		        ['NY', 'New York', 'Empire State'],
		        ['NC', 'North Carolina', 'First in Freedom'],
		        ['ND', 'North Dakota', 'Peace Garden State'],
		        ['OH', 'Ohio', 'The Heart of it All'],
		        ['OK', 'Oklahoma', 'Oklahoma is OK'],
		        ['OR', 'Oregon', 'Pacific Wonderland'],
		        ['PA', 'Pennsylvania', 'Keystone State'],
		        ['RI', 'Rhode Island', 'Ocean State'],
		        ['SC', 'South Carolina', 'Nothing Could be Finer'],
		        ['SD', 'South Dakota', 'Great Faces, Great Places'],
		        ['TN', 'Tennessee', 'Volunteer State'],
		        ['TX', 'Texas', 'Lone Star State'],
		        ['UT', 'Utah', 'Salt Lake State'],
		        ['VT', 'Vermont', 'Green Mountain State'],
		        ['VA', 'Virginia', 'Mother of States'],
		        ['WA', 'Washington', 'Green Tree State'],
		        ['WV', 'West Virginia', 'Mountain State'],
		        ['WI', 'Wisconsin', "America's Dairyland"],
		        ['WY', 'Wyoming', 'Like No Place on Earth']
		    ];

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
     title:'General',
     labelAlign: 'right',
     labelWidth: 85,
     width:340,
     waitMsgTarget: true,

     // configure how to read the XML Data
     reader : new Ext.data.XmlReader({
         record : 'contact',
         success: '@success'
     }, [
         {name: 'first', mapping:'name/first'}, // custom mapping
         {name: 'last', mapping:'name/last'},
         'company', 'email', 'state',
         {name: 'dob', type:'date', dateFormat:'m/d/Y'} // custom data types
     ]),

     // reusable eror reader class defined at the end of this file
     errorReader: new Ext.form.XmlErrorReader(),

     items: [
         new Ext.form.FieldSet({
             title: 'Contact Information',
             autoHeight: true,
             defaultType: 'textfield',
             items: [{
                     fieldLabel: 'First Name',
                     emptyText: 'First Name',
                     name: 'first',
                     width:190
                 }, {
                     fieldLabel: 'Last Name',
                     emptyText: 'Last Name',
                     name: 'last',
                     width:190
                 }, {
                     fieldLabel: 'Company',
                     name: 'company',
                     width:190
                 }, {
                     fieldLabel: 'Email',
                     name: 'email',
                     vtype:'email',
                     width:190
                 },

                 new Ext.form.ComboBox({
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
                 })
             ]
         })
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
         fs.getForm().submit({url:'xml-errors.xml', waitMsg:'Saving Data...', submitEmptyText: false});
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
		title:"equipment",
		html: "I am tab 4's content. I also have an event listener attached.",		
		tbar:{
			items:[{
			  text:'suggestion'
		  },{
			  text:'edit',
  			handler: function(){
					//Netzke.page.windowWithGridPanel.show();
					url = "equipment/show/" + current_site_id;
					window.open(url);
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
    items:[fs,grid,{
          title: 'Suggestion',
          xtype:'htmleditor'
    //anchor:'98%',
    //listeners: {
    //    activate: handleActivate
    //},
    //html: "I am tab 4's content. I also have an event listener attached.",

    }
    ]
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


