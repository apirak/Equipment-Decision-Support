class SiteController < ApplicationController
  def show
    @site = Site.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @site }
    end
  end
  
  def create
    @site = Site.new()
    @site.title = "About"
    @site.name = "Position"
    @site.lng = params[:lng]
    @site.lat = params[:lat]
    if @site.save
      logger.debug("save success #{params[:format]} id #{@site.id}")
    end
    render :action => 'show'
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
    if @site.save
      logger.debug("save success #{params[:format]} x")
    end
    # respond_to do |format|
    #       format.html
    #       format.xml  { render_to :action => 'show' }
    #     end
    render :action => 'show'
  end
  
  def site_position
    @site = Site.find(params[:id])
    @site.lng = params[:lng]
    @site.lat = params[:lat]
    if @site.save
      logger.debug("save success #{params[:format]} id #{@site.id}")
    end
    
    render :action => 'show'
  end
  
  def equipment
    @site = Site.find(params[:id])
    if params[:suggestion]
      @site.suggest_equipment
    end
    @equipments = EquipmentNameSite.find(:all, :conditions => ['position_id = ?', params[:id]], :order => "score DESC")
  end

end
