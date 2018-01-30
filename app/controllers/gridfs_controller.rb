class GridfsController < ApplicationController
  def preview_image
    @shop = Shop.find(params[:id])
    content = @shop.preview_image.read
      
    if stale?(etag: content, last_modified: @shop.updated_at.utc, public: true)
      send_data content, type: @shop.preview_image.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end
end