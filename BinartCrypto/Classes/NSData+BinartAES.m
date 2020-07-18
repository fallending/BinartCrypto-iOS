#import <CommonCrypto/CommonCryptor.h>
#import "NSData+BinartAES.h"

// MARK: -

@implementation NSData (AES)

- (NSData *)BinartAES_CBC_EncryptWith:(NSData *)key iv:(NSData *)iv {
    NSData *retData = nil;
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    bzero(buffer, bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          key.bytes, key.length,
                                          iv.bytes,
                                          self.bytes, self.length,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        retData = [NSData dataWithBytes:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return retData;
    
}

- (NSData *)BinartAES_CBC_DecryptWith:(NSData *)key iv:(NSData *)iv {
    NSData *retData = nil;
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    bzero(buffer, bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          key.bytes, key.length,
                                          iv.bytes,
                                          self.bytes, self.length,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        retData = [NSData dataWithBytes:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return retData;
}


- (NSData *)BinartAES_ECB_EncryptWith:(NSData *)key {
    NSData *retData = nil;
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    bzero(buffer, bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          key.bytes, key.length,
                                          NULL,
                                          self.bytes, self.length,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        retData = [NSData dataWithBytes:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return retData;
}

- (NSData *)BinartAES_ECB_DecryptWith:(NSData *)key {
    NSData *retData = nil;
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    bzero(buffer, bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          key.bytes, key.length,
                                          NULL,
                                          self.bytes, self.length,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        retData = [NSData dataWithBytes:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return retData;
}

@end
