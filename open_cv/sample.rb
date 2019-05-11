require 'opencv'
include OpenCV

#画像を読み込む
#src_img = CvMat.load('../images/Lenna.png')
#src_img = CvMat.load('/Users/match/Desktop/GitHub/ruby/images/Lenna.png')
src_img = OpenCV::IplImage.load("/Users/match/Desktop/GitHub/ruby/images/Lenna.png")


gray_img = src_img.BGR2GRAY
bin_img = gray_img.threshold(128, 255, :binary)
canny_img = src_img.BGR2GRAY.canny(120,200)

GUI::Window.new('src').show(src_img)
GUI::Window.new('gray').show(gray_img)
GUI::Window.new('bin').show(bin_img)
GUI::Window.new('canny').show(canny_img)

GUI::wait_key
