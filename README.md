# UEditor Rails

UEditor integration with Rails.

## Demo

Go to `test/dummy` and `rails s`, remember `bundle` first.

## Installation

Add the gem to your Gemfie `gem 'ueditor_rails', :git => 'https://github.com/jasl/ueditor_rails.git'` or `gem 'ueditor_rails'`.

Or， `gem 'uedtior_rails, github: 'Yundianjia/ueditor_rails'`。 

`bundle` and run `rails g ueditor_rails:install`.

## Configure

See `app/assets/javascripts/ueditor_config.js.erb` for detail.


## Using

`require ./ueditor_config`(which generated at installation) to your application.js first.

**samples**

`f.ueditor_text :body`

`ueditor_text_tag 'test2', 'text here'`

`ueditor_text_tag 'test1', 'text here', :id => 'xxxx', :width => 500, :toolbars => [["bold","italic","underline"]]`

The option can be any which in `ueditor_config.js.erb`.

## Upload backends

I don't want implement it, cause it's design depends your business, so you should do it by yourself. 
you can modify `app/assets/javascripts/ueditor_config.js.erb` like `imageUrl: "<%= Rails.application.routes.url_helpers.ueditor_image_path %>"` to make it available.

## Cross domain support

Add `UeditorRails.enable_cross_domain = true` in a initializer or 'application.rb'.

## 遇到的问题

编译资产，会将 `link.html.erb` 文件，生成 `link-4fab84bc5a2d3b1a19f2f1308f8726d8.html` 这样的文件，而服务器请求时，请求的又是 `link.html` 文件，此时，需要在生成资产时，将编译后的文件，拷贝成 html 文件， 需要在重载的资产编译文件，添加如下的处理: 

```
execute "cp -r #{ueditor_assets_dir} public/assets/ueditor"
execute "cp -r #{ueditor_dir}/app/assets/javascripts/**/* public/assets/ueditor"
`ls public/assets/ueditor/dialogs/**/*-*.html`.split(/\n/).each do |file|
  dir = File.dirname file
  new_name = File.basename(file).split('-').first + '.html'

  system "cp #{file} #{dir}/#{new_name}"
end
```

## More about UEditor

[UEditor doc](http://ueditor.baidu.com/website/document.html)

## Help me

You can open tickets to notice me bugs or suggestions, also you can fork it and send me PR.

## License

This project rocks and uses [MIT-LICENSE](http://jasl.mit-license.org/). Jasl
