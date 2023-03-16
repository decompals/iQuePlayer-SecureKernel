#ifndef _STRING_H
#define _STRING_H

#include "PR/ultratypes.h"

char* strchr(char* str, char c);
size_t strlen(const char* str);
int strcmp(const char* str1, const char* str2);
int strncmp(const char* str1, const char* str2, int num);
const char* strstr(const char* str1, const char* str2);
void* memcpy(void* dst, void* src, size_t num);
void* memset(void* ptr, int value, size_t num);
int memcmp(const void* ptr1, const void* ptr2, size_t num);

// extra
void memclear(void* ptr, size_t num);
void* wordcopy(void* dst, void* src, s32 nWords);

#endif
