var dateTimeToText = function(dt){
		var month = dt.getMonth() + 1
		var day = dt.getDate()
		var year = dt.getFullYear()
		var min = dt.getMinutes()
		var hour = dt.getHours()
		return ("" + hour + ":" + min + " " + month + "/" + day + "/" + year)
}

var currentTime = function(){
		var currentTime = new Date()
		return dateTimeToText(currentTime)
}

var messagePacking = function(message){
	console.log(message)
	var m = "<div class='message'> Apirak: " + message + "</div>"
	m = "<div class='date'>" + currentTime() + "</div>" + m
	m = "<div class='log'>" +  m + "</div>"
	console.log(m)
	return m
}

var logPanel = new Ext.Panel({
	title: 'Log',
  collapsible: true,
  region:'west',
  layout:'vbox',
  width: 200,
  margins: '0 0 5 5',
  minSize: 150,
  maxSize: 250,
  layoutConfig: {
      align : 'stretch',
      pack  : 'start'
  },
  defaults: {
      border: false
  },
  items: [
  {
      html:"<div id='log-list'><div id='message_1'></div></div>",
      flex:5
  },
  {
      xtype:'htmleditor',
      id:'messageLog',
      fieldLabel:'Biography',
      border: false,
      height:100,
      anchor:'98%',
			enableColors: false,
      enableAlignments: false,
			enableFont: false,
			enableLinks: false,
			enableFontSize: false,
			enableSourceEdit: false
  }
  ],
  bbar: {
      items:[{
          text: 'Save',
          iconCls: 'save',
			    handler: function(){
				      var dh = Ext.DomHelper;
							temp_message = Ext.getCmp('messageLog').getValue();

							logListHTML = Ext.getDom('log-list').innerHTML;
							loglistHTML = logListHTML + messagePacking(temp_message);
							Ext.getDom('log-list').innerHTML = loglistHTML;
							
							Ext.getCmp('messageLog').setValue("");
			    }
      }]
  }
})