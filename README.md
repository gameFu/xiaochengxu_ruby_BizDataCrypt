## 微信小程序用户数据解密算法 ruby

使用方法

```ruby

  WxBizDataCrypt.new(app_id, session_key).decryptData(encryptedData, iv)

```

* app_id 为小程序app_id
* session_key 为通过通过wx.login 获取的code，appid, appsecret 请求换取session_key接口获得的加密签名密钥，详见[code换取session_key部分](https://mp.weixin.qq.com/debug/wxadoc/dev/api/api-login.html?t=20161122)
* encryptedData 为调取wx.get_user_info得到的加密数据，其中包含open_id和union_id，详见[get_user_info接口返回参数](https://mp.weixin.qq.com/debug/wxadoc/dev/api/open.html?t=20161122)
* iv为加密算法初始向量，详见[get_user_info接口返回参数](https://mp.weixin.qq.com/debug/wxadoc/dev/api/open.html?t=20161122)
