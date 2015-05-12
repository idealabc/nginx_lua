# nginx_lua 学习


##目标

	用nginx+lua实现一个移动网站的服务端
	
##思路

####lua处理HTML的模版用下面的程序

https://github.com/bungle/lua-resty-template#boolean-templatecachingboolean-or-nil    


####MVC写一个简单的URL分割，分发不同的业务逻

	nginx的配置
		set $template_root /usr/local/openresty/nginx/html/templates;
        location ~ ^/app/([-_a-zA-Z0-9/]+) {
             default_type 'text/html';
      	lua_code_cache off; #off online on
                  content_by_lua_file conf/app/init.lua;
 		}
 		
####编写config，配置mysql,redis





