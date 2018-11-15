module DeskHelper
  def safe_desk_img_path(desk)
    if desk.photo.file
      return cl_image_path desk.photo, height: 600, width: 900, crop: :fill
    else
      return ''
    end
  end

  def safe_desk_img_large_path(desk)
    if desk.photo.file
      return cl_image_path desk.photo, height: 300, width: 700, crop: :scale
    else
      return ''
    end
  end
end
