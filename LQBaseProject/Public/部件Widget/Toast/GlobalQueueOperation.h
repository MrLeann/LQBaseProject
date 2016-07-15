//
//  GlobalQueueOperation.h


#import <Foundation/Foundation.h>

typedef void (^GlobalQueueBlock)(dispatch_block_t block);

@interface GlobalQueueOperation : NSObject

//网络请求后台加载
/**
 *  全局队列：异步、并发、没有顺序、速度快
 *
 *  @param block 代码块
 */
void doInDisPatchWithConcurrent(dispatch_block_t block);

/**
 *  全局队列：异步、串行、顺序执行、速度慢
 *
 *  @param block 代码块
 */
void doInDispatchSerialWith(dispatch_block_t block);

/**
 *  主线程执行
 *
 *  @param block 代码块
 */
void doInMain(dispatch_block_t block);

@end
