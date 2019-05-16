# Ref: https://qiita.com/prgseek/items/38f74d99b74baa3b42f7



# write
file = File.open("output/texts/write_samurai.txt","w+")
file.puts "[Write] Hello Samurai!"
file.puts file.size # ファイルサイズ
file.puts file.atime # 最終アクセス時刻
file.puts file.mtime # 最終更新時刻
file.close

# append
file = File.open("output/texts/append_samurai.txt", "a")

file.puts "[Append] Hello Samurai!"
file.puts file.size # ファイルサイズ
file.puts file.atime # 最終アクセス時刻
file.puts file.mtime # 最終更新時刻
file.close #ファイルを閉じる

# read
file = open("output/texts/samurai.txt")    # モード省略時は "r" でオープンされます
lines = file.read().split("\n")
lines.each do | line |
  line.chomp!
  puts line
end
file.close

# 権限
File.chmod(0666, "output/texts/samurai.txt")


# directory 操作 --------------------------------------------------
if !Dir.exist?("tmp")
  Dir::mkdir("tmp", 0700)
end

# 存在するか
p Dir.exist?("/path/to/none") # false

# 現在のユーザのホームディレクトリを取得
p Dir.home

# カレントディレクトリを取得
p Dir.pwd # "/Users/miro/Documents/RubyProjects/MyRuby"



# FileUtils 操作 --------------------------------------------------
require 'fileutils'

# 空ファイルの作成
FileUtils.touch("list.txt")
