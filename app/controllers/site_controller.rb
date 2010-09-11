class SiteController < ApplicationController
  def show
    @site = Site.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @site }
    end
  end
  
  def update
    @site = Site.find(params[:id])
    param_site = {}
    params.keys.each do |k|
      param_site[k] = params[k]
    end
    param_site = params
    param_site.delete("authenticity_token")
    param_site.delete("action")
    param_site.delete("controller")
    param_site.delete("id")
    param_site.delete("format")
  
    param_site.keys.each do |k|
      if param_site[k] == "on"
        param_site[k] = true
      end
    end
    
    @site.attributes = param_site
    logger.debug(@site.inspect)
    if @site.save
      logger.debug("save success #{params[:format]} x")
    end
    # respond_to do |format|
    #       format.html
    #       format.xml  { render_to :action => 'show' }
    #     end
    render :action => 'show'
  end
  
  def equipment
    if params[:suggestion]
      site = Site.find(params[:id])
      site.suggest_equipment
    end
    @equipments = EquipmentNameSite.find(:all, :conditions => ['position_id = ?', params[:id]], :order => "score DESC")
  end

end


# <message success="true"> 
# <contact> 
#     <name> 
#         <first>Jack</first> 
#         <last>Slocum</last> 
#     </name> 
#     <company>Ext JS</company> 
#     <email>support@extjs.com</email> 
#     <state>OH</state> 
#     <dob>04/15/2007</dob> 
# </contact> 
# </message>