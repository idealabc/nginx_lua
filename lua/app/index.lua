local ok, dispatcher  = pcall(require, "app.common.dispatcher")

--local ok, dispatcher  = pcall(require, "app.test.nginx")
ngx.exit(ngx.HTTP_OK)
