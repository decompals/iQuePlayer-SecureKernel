#ifndef MACROS_H_
#define MACROS_H_

#define ARRAY_COUNT(arr) ((s32)(sizeof(arr)/sizeof((arr)[0])))

#if (__STDC_VERSION__ >= 201112L) /* C11 */
#define ALIGNOF(x) _Alignof(x)
#else /* __GNUC__ */
#define ALIGNOF(x) __alignof__(x)
#endif

#endif
