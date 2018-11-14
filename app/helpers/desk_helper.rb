module DeskHelper
  def safe_desk_img_path(desk)
    if desk.photo.file
      return cl_image_path desk.photo, height: 300, width: 400, crop: :fill
    else
      return ''
    end
  end
end
