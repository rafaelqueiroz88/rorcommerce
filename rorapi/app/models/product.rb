class Product < ApplicationRecord

    attr_accessor :encrypt_id

    def encrypt_id
        Encryptor.encrypt(self.id.to_s)
    end
end
