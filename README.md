这个一个练习项目用于学习sinatra与Rails的区别
 Rails有Rails new 命令可以创建一个Rails工程,而sinatra没有
 sinatra创建项目需手工创建目录和文件，目录结构一般与Rails的项目结构保持一致
 sinatra以一个主要的.rb文件做为项目的主文件,使用ruby命令执行或配置到config.ru以rack运行
 sinatra中confing model view controler(一般在主文件中)，route(主文件中配置)等都是一个文件一个文件来创建
运行命令
puma config.ru 
