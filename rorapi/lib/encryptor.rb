class Encryptor

    def self.encrypt(unencrypted_string)
      _cipher = OpenSSL::Cipher.new('AES-256-CBC').encrypt    
      _cipher.key = "AtafSyyodFgHwvbGNFtekoRKarGvMJlu"
      if unencrypted_string.present?      
        encrypted_string = _cipher.update(unencrypted_string) + _cipher.final
        Base64.encode64(encrypted_string.unpack('H*')[0].upcase).chomp
        else
          encrypted_string = ""
      end
    end
  
    def self.decrypt(encrypted_string)
      _cipher = OpenSSL::Cipher.new('AES-256-CBC').decrypt
      _cipher.key = "AtafSyyodFgHwvbGNFtekoRKarGvMJlu"    
      encrypted_string = [Base64.decode64(encrypted_string)].pack("H*")  
      if encrypted_string.present?  
        unencrypted_string = _cipher.update(encrypted_string) + _cipher.final
      else
        unencrypted_string = ""
      end
    end
  
  end