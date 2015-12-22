module ApplicationHelper
  # Common helpers sit under lib/helpers
  include TextFormattingHelper

  def bootstrap_flash_class(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Create a image_tag or video_tag for the file and link_to
  # the path of the path_file
  def image_or_video (file)
    if ["image/jpeg", "image/gif", "image/png", "image/jpg"].include?(file.file_content_type)
      image_tag(file.file.url)
    elsif ["video/mp4", "video/avi", "video/mpeg", "video/x-ms-wmv", "video/x-flv"].include?(file.file_content_type)
      video_tag(file.file.url, controls: true)
    end
  end






  #*******************Picture sizing****************************************************



  # Calculate height for div (picholder) in a post which include pictures (two for now)
  # take consideration of the side length and gap between the pictures
  # Return an array containing two hash that has {:name, :div_w, :div_h, :left, :file}
  def size_for_two(pics, side_length, pic_gap)
    w0 = pics[0].dimensions[0]
    w1 = pics[1].dimensions[0]
    h0 = pics[0].dimensions[1]
    h1 = pics[1].dimensions[1]

    # if W, place one on top of another
    if three_by_one(w0, h0) || three_by_one(w1, h1)
      div_h0 = div_h1 = (side_length / 3.0).round
      div_w0 = div_w1 = side_length
      div_left0 = div_left1 = div_top0 = 0
      div_top1 = div_h0 + pic_gap
      outer_h = div_h0 + div_h1 + pic_gap
    # else, place one beside another
    else
      div_h0 = div_h1 = side_length / 2
      div_w0 = div_w1 = side_length / 2 - pic_gap / 2
      div_left0 = div_top0 = div_top1 = 0
      div_left1 = div_w0 + pic_gap
      outer_h = div_h0
    end

    temp_h0 = one_image_fit(w0, h0, div_w0, div_h0)
    temp_h1 = one_image_fit(w1, h1, div_w1, div_h1)

    img_w0, img_h0, img_left0, img_top0 =\
      temp_h0[:img_w], temp_h0[:img_h], temp_h0[:img_left], temp_h0[:img_top]

    img_w1, img_h1, img_left1, img_top1 =\
      temp_h1[:img_w], temp_h1[:img_h], temp_h1[:img_left], temp_h1[:img_top]

    return [{name: pics[0].file_file_name, outer_h: outer_h,\
        div_w: div_w0, div_h: div_h0, div_left: div_left0, div_top: div_top0,\
        img_w: img_w0, img_h: img_h0, img_left: img_left0, img_top: img_top0, file: pics[0]}, 
     {name: pics[1].file_file_name, outer_h: outer_h,\
        div_w: div_w0, div_h: div_h0, div_left: div_left1, div_top: div_top1,\
        img_w: img_w1, img_h: img_h1, img_left: img_left1, img_top: img_top1, file: pics[1]}]

  end

  # Calculate height for div (picholder) in a post which include pictures (three for now)
  # make sure width is 470px
  # Use "primary pic" like fb has. "primary pic" is the first pic selected.
  # Follow the priciple facebook has - display the most of the pictures
  def size_for_three(pics, side_length, pic_gap)
    w0 = pics[0].dimensions[0]
    w1 = pics[1].dimensions[0]
    w2 = pics[2].dimensions[0]
    h0 = pics[0].dimensions[1]
    h1 = pics[1].dimensions[1]
    h2 = pics[2].dimensions[1]
    wh_pairs = [[w0, h0], [w1, h1], [w2, h2]]

    # if HH or WW, primary pic will be displayed to the leftmost or topmost,
    # however, the its space will not be larger.

    # if WW 
    if two_by_one_a(wh_pairs)
      # since number is assigned with value rather than reference, I can do this.
      # otherwise, I might need div_w0, div_w1, div_w2 = 470, 470, 470
      div_w0 = div_w1 = div_w2 = side_length
      div_h0 = div_h1 = div_h2 = (side_length / 3.0).floor - 1

      div_top0, div_top1, div_top2 = 0, div_h0 + pic_gap, div_h0 * 2 + pic_gap * 2
      div_left0 = div_left1 = div_left2 = 0

      # calculate the height, width image for each image depends on their ratio
      temp_h0 = set_img_pos_for_three_WW(wh_pairs[0], side_length)
      temp_h1 = set_img_pos_for_three_WW(wh_pairs[1], side_length)
      temp_h2 = set_img_pos_for_three_WW(wh_pairs[2], side_length)

    # if HH
    elsif two_by_one_a([[h0, w0], [h1, w1], [h2, w2]])
      div_w0 = div_w1 = div_w2 = (side_length / 3.0).floor - 1
      div_h0 = div_h1 = div_h2 = side_length

      div_top0 = div_top1 = div_top2 = 0
      div_left0, div_left1, div_left2 = 0, div_w0 + pic_gap, div_w0 * 2 + pic_gap * 2

      temp_h0 = set_img_pos_for_three_HH(wh_pairs[0], side_length)
      temp_h1 = set_img_pos_for_three_HH(wh_pairs[1], side_length)
      temp_h2 = set_img_pos_for_three_HH(wh_pairs[2], side_length)

    # if hh or ww are not strong, the layout of the pics depends on the primary pic,
    # whereas the primary pic will get the largest space.
    else

      # the primary pic is a wide pic
      if (w0 >= h0)

         # w
        if three_by_one(w0, h0)
          div_w0, div_h0 = side_length, side_length / 2

        # W
        else
          div_w0, div_h0 = side_length, side_length / 3 * 2

        end

        div_left0 = div_top0 = 0

        div_w1 = side_length - side_length / 2 - pic_gap / 2
        div_h1 = side_length - div_h0 - pic_gap
        div_w2, div_h2 = div_w1, div_h1
        div_left1, div_top1 = 0, div_h0 + pic_gap
        div_left2, div_top2 = div_w1 + pic_gap, div_h0 + pic_gap

      # the primary pic is a high pic
      else

        # h
        if three_by_one(h0, w0)
          div_w0, div_h0 = side_length / 2, side_length

        # H
        else
          div_w0, div_h0 = side_length / 3 * 2, side_length

        end

        div_left0 = div_top0 = 0

        div_w1 = side_length - div_w0 - pic_gap
        div_h1 = side_length - side_length / 2 - pic_gap / 2
        div_w2, div_h2 = div_w1, div_h1
        div_left1, div_top1 = div_w0 + pic_gap, 0
        div_left2, div_top2 = div_w0 + pic_gap, div_h1 + pic_gap

      end 

      temp_h0 = one_image_fit(w0, h0, div_w0, div_h0)
      temp_h1 = one_image_fit(w1, h1, div_w1, div_h1)
      temp_h2 = one_image_fit(w2, h2, div_w2, div_h2)


    end

    img_w0, img_h0, img_left0, img_top0 =\
      temp_h0[:img_w], temp_h0[:img_h], temp_h0[:img_left], temp_h0[:img_top]

    img_w1, img_h1, img_left1, img_top1 =\
      temp_h1[:img_w], temp_h1[:img_h], temp_h1[:img_left], temp_h1[:img_top]

    img_w2, img_h2, img_left2, img_top2 =\
      temp_h2[:img_w], temp_h2[:img_h], temp_h2[:img_left], temp_h2[:img_top]

    return [{name: pics[0].file_file_name, div_w: div_w0, div_h: div_h0, div_left: div_left0,\
        div_top: div_top0, img_left: img_left0, img_top: img_top0,\
        img_w: img_w0, img_h: img_h0, file: pics[0]}, 
      {name: pics[1].file_file_name, div_w: div_w1, div_h: div_h1, div_left: div_left1,\
        div_top: div_top1, img_left: img_left1, img_top: img_top1,\
        img_w: img_w1, img_h: img_h1, file: pics[1]},
      {name: pics[2].file_file_name, div_w: div_w2, div_h: div_h2, div_left: div_left2,\
        div_top: div_top2, img_left: img_left2, img_top: img_top2,\
        img_w: img_w2, img_h: img_h2, file: pics[2]}]

  end


  # Special function for now to help add the plus sign
  def size_for_four_sqr_special(pics, side_length, pic_gap)
    w0 = pics[0].dimensions[0]
    w1 = pics[1].dimensions[0]
    w2 = pics[2].dimensions[0]
    h0 = pics[0].dimensions[1]
    h1 = pics[1].dimensions[1]
    h2 = pics[2].dimensions[1]
    wh_pairs = [[w0, h0], [w1, h1], [w2, h2]]

    div_w0 = div_w1 = div_w2 = div_h0 = div_h1 = div_h2 = side_length / 2 - pic_gap / 2
    div_left0 = div_left2 = 0
    div_top0 = div_top1 = 0
    div_left1 = div_top2 = side_length / 2 + pic_gap / 2

    temp_h0 = one_image_fit(w0, h0, div_w0, div_h0)
    temp_h1 = one_image_fit(w1, h1, div_w1, div_h1)
    temp_h2 = one_image_fit(w2, h2, div_w2, div_h2)

    img_w0, img_h0, img_left0, img_top0 =\
      temp_h0[:img_w], temp_h0[:img_h], temp_h0[:img_left], temp_h0[:img_top] 
      
    img_w1, img_h1, img_left1, img_top1 =\
      temp_h1[:img_w], temp_h1[:img_h], temp_h1[:img_left], temp_h1[:img_top]

    img_w2, img_h2, img_left2, img_top2 =\
      temp_h2[:img_w], temp_h2[:img_h], temp_h2[:img_left], temp_h2[:img_top]   


    return [{name: pics[0].file_file_name, div_w: div_w0, div_h: div_h0, div_left: div_left0,\
        div_top: div_top0, img_left: img_left0, img_top: img_top0,\
        img_w: img_w0, img_h: img_h0, file: pics[0]}, 
      {name: pics[1].file_file_name, div_w: div_w1, div_h: div_h1, div_left: div_left1,\
        div_top: div_top1, img_left: img_left1, img_top: img_top1,\
        img_w: img_w1, img_h: img_h1, file: pics[1]},
      {name: pics[2].file_file_name, div_w: div_w2, div_h: div_h2, div_left: div_left2,\
        div_top: div_top2, img_left: img_left2, img_top: img_top2,\
        img_w: img_w2, img_h: img_h2, file: pics[2]}]

  end

  # fit one image into the a given box,
  # the box has starting pos x=0 and y=0
  def one_image_fit(w, h, box_w, box_h)

  #   # a wide box
  #   if (box_w >= box_h)

    # higher
    if (h.to_f / w) >= (box_h.to_f / box_w)
      m = box_w.to_f / w
      img_h = (m * h).round
      img_w = box_w
      img_top = img_left = 0

    # fatter
    else
      m = box_h.to_f / h
      img_h = box_h
      img_w = (m * w).round
      img_top = 0
      img_left = - (img_w - box_w) / 2

    end

  #   # a high box
  #   else

  #   end
    return {img_w: img_w, img_h: img_h, img_left: img_left, img_top: img_top}
  end


  # Return the width, height, left position and top position for the image with the
  # actual width and height given by the pair. The function currently only works for
  # three photo positioning in the case of WW
  def set_img_pos_for_three_WW(pair, side_length)
    if three_by_one(pair[0], pair[1])
      # if ratio at least 3, height is set to 
      height = (side_length / 3.0).floor - 1
      m = height.to_f / pair[1]
      reserve_w = false
    else 
      # if ratio smaller than 3, width is set to 
      width = side_length.to_f
      m = width / pair[0]
      reserve_w = true
    end

    img_h, img_w = (pair[1] * m).round, (pair[0] * m).round

    if reserve_w
      img_left = 0
      # fb set top to 0 in this case
      img_top = 0
      # img_top = - ((img_h - 155) / 2).floor
    else
      img_top = 0
      img_left = - ((img_w - side_length) / 2.0).floor
    end

    return {img_w: img_w, img_h: img_h, img_left: img_left, img_top: img_top}

  end

  ## Maybe combine set_img_pos_for_three_HH and set_img_pos_for_three_WW.
  # Return the width, height, left position and top position for the image with the
  # actual width and height given by the pair. The function currently only works for
  # three photo positioning in the case of HH
  def set_img_pos_for_three_HH(pair, side_length)
    if three_by_one(pair[1], pair[0])
      # if ratio at least 3, width is set to 
      # thin one
      width = (side_length / 3.0).floor - 1
      m = width.to_f / pair[0]
      reserve_h = false
    else 
      # if ratio smaller than 3, heigth is set to
      # fatter one
      height = side_length.to_f
      m = height / pair[1]
      reserve_h = true
    end

    img_h, img_w = (pair[1] * m).round, (pair[0] * m).round

    if reserve_h
      width = (side_length / 3.0).floor - 1
      img_left = - ((img_w - width) / 2.0).floor
      img_top = 0
    else
      img_top = 0
      img_left = 0
    end

    return {img_w: img_w, img_h: img_h, img_left: img_left, img_top: img_top}

  end


  # return a boolean
  # return true if at least two of the pairs in array a have their first number at least
  # twice as big as their second number. 
  # a = [pair1, pair2, pair3] where each pair is either [h,w] or [w,h].
  def two_by_one_a(a)
    counter = 0
    a.each do |pair|

      if (pair[0] >= pair[1] * 2)
        counter += 1
      end

      if (counter >= 2)
        return true
      end

    end

    return false

  end

  # check if the x, y ratio is at least 3
  def three_by_one(x, y)
    if (x / y) >= 3
      return true
    else
      return false
    end
  end

  # separate videos and pictures
  def pic_and_vid_separator(pvs)
    pics = []
    vids = []
    pvs.each do |file|
      if ["image/jpeg", "image/gif", "image/png", "image/jpg"].include?(file.file_content_type)
        pics.push(file)
      elsif ["video/mp4", "video/avi", "video/mpeg", "video/x-ms-wmv", "video/x-flv"].include?(file.file_content_type)
        vids.push(file)
      end
    end

    return {pics: pics, vids: vids}
  end

end





