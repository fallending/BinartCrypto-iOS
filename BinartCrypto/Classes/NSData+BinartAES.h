#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// AES       加密模式 ECB CBC CTR OFB CFB
// 填充       pkcs5padding pkcs7padding zeropadding iso10126 ansix923
// 数据块      128 192 256
// 密码       有效密码 16位/24/32，其中24/32需要JCE（java中）
// 偏移量      iv偏移量（ECB不用设置）
// 输出       base64/hex
// 字符集      gb2312 gbk gb18030 utf8

@interface NSData (BinartAES)

// 目前只提供一个
// pkcs5 ?= pkcs7
- (NSData *)BinartAES_CBC_DecryptWith:(NSData *)key iv:(NSData *)iv;

@end


NS_ASSUME_NONNULL_END
