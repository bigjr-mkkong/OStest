#ifndef __LINKAGE_H__
#define __LINKAGE_H__

#define SYMBOL_NAME(X)			X

#define SYMBOL_NAME_STR(X)		#X

#define SYMBOL_NAME_LABEL(X) 	X##:



#define ENTRY(name)\
.global	SYMBOL_NAME(name);\
SYMBOL_NAME_LABEL(name)

#endif