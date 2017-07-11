class XmlController < ApplicationController
  def index
    @users = User.order(:name)
    respond_to do |format|
      format.html { redirect_to root_path}
      format.xls {send_data @users.to_xls(col_sep: "\t")}
    end
  end
end
