require 'opencv'
include OpenCV

OPENCV_PATH = "/usr/local/Cellar/opencv@2/2.4.13.7_3"
SHARE_PATH = "/share/OpenCV"


#data = "#{OPENCV_PATH+SHARE_PATH}/haarcascades/haarcascade_frontalface_alt.xml"
#data = '/usr/local/Cellar/opencv@2/2.4.13.7_3/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml' #xmlの形式が古いためNG
data = "/Users/match/Desktop/GitHub/ruby/open_cv/xml/haarcascade_frontalface_alt.xml" #最新のxml
detector = CvHaarClassifierCascade::load(data)
#src_img = CvMat.load("Lenna.bmp")
#src_img = OpenCV::IplImage.load("/Users/match/Desktop/GitHub/ruby/images/Lenna.png") # OK
# src_img = OpenCV::IplImage.load("/Users/match/Desktop/GitHub/ruby/images/gakki_1.jpg") # NG
# src_img_2 = OpenCV::IplImage.load("/Users/match/Desktop/GitHub/ruby/images/gakki_1_2.jpg") # NG
src_img = OpenCV::CvMat.load("/Users/match/Desktop/GitHub/ruby/images/gakki_1.jpg") # OK
puts src_img.class


detector.detect_objects(src_img).each do |region|
  src_img.rectangle!(region.top_left, region.bottom_right, :color => CvColor::Red, :thickness => 3)
end
GUI::Window.new('Result').show(src_img)
#
# detector.detect_objects(src_img_2).each do |region|
#   src_img_2.rectangle!(region.top_left, region.bottom_right, :color => CvColor::Red, :thickness => 3)
# end
# GUI::Window.new('Result').show(src_img_2)


GUI::wait_key
