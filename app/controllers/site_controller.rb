class SiteController < ApplicationController
  def show
    @site = Site.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @site }
    end
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