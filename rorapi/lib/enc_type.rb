class EncType < ActiveModel::Type::Value  
    def cast(value)    
      Encryptor.decrypt(value).force_encoding ("UTF-8") if value
    rescue OpenSSL::Cipher::CipherError
      value
    end
  
    def serialize(value)    
      Encryptor.encrypt(value).force_encoding ("UTF-8") if value
    end
  end