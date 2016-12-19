class WxBizDataCrypt
  attr_accessor :session_key, :app_id
  def initialize(app_id, session_key)
    @app_id = app_id
    @session_key = session_key
  end
  def decryptData(encryptedData, iv)
    aseKey = Base64.decode64(@session_key)
    aesIV = Base64.decode64(iv)
    aesCipher = Base64.decode64(encryptedData)
    cipher = build_decrypt_cipher(aesIV, aseKey)
    decrypted = cipher.update(aesCipher) + cipher.final
    # 返回json
    JSON.parse decrypted[0..-(decrypted.last.ord+1)]
  end

  private
  def build_decrypt_cipher(iv, session_key)
    OpenSSL::Cipher.new('AES-128-CBC').tap do |cipher|
      cipher.decrypt
      cipher.key = session_key
      cipher.iv = iv
      cipher.padding = 0
    end
  end

end
