require 'opencv'
include OpenCV

puts "start!!"

save_dir = "./out_faces"

cascade_front_file = "/Users/match/Desktop/GitHub/ruby/open_cv/xml/haarcascade_frontalface_alt.xml" #最新のxml
cascade_front = CvHaarClassifierCascade::load(cascade_front_file)

cap = OpenCV::CvCapture.open
#cap = OpenCV::CvCapture.open("/Users/match/Desktop/GitHub/ruby/video/aragaki.mp4")

win = GUI::Window.new("win")

img_last = nil

#resize_value = OpenCV::CvSize.new(640, 360)
fps = 20
frame_msec = 1000/fps
#fmt = OpenCV::CvVideo.fourcc()
#writer = OpenCV::CvVideoWriter.new("output.mp4", 'MP4V', fps, resize_value)
writer = OpenCV::CvVideoWriter.new("output.avi", 'XVID', fps, OpenCV::CvSize.new(cap.width, cap.height))


puts " while start!!"
while true do
  frame = cap.query

  break unless frame
  win.show frame

  #frame.resize(resize_value) #OK

  frame2 = frame.clone

  gray = frame.BGR2GRAY
  img_b = gray.threshold(127, 255, :binary)

  unless img_last.nil? then
    face_list_front = cascade_front.detect_objects(gray)
    if face_list_front.empty?
      writer.write(frame)
    else
      face_list_front.each do |region|
        rectangle_frame = frame2.rectangle(region.top_left, region.bottom_right, :color => CvColor::Red, :thickness => 3)
        win.show(rectangle_frame)
        writer.write(rectangle_frame)
      end
    end
  end

  img_last = img_b

  #c = GUI::wait_key(frame_msec)
  c = GUI::wait_key(fps)
  break if c == 27

end


cap.close
writer.close

#cv2.destroyAllWindows()
#OpenCV::CvDestroyAllWindows()
#GUI::wait_key
#win.close()
